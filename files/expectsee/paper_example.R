# ExpectSEE: self-contained synthetic illustration of the paper workflow.
# This is not an empirical replication. No external data are read or written.
# Demo tau = 0.80; the paper uses 0.99855. Small synthetic samples are more
# informative at a moderate expectile than at an extreme tail expectile.
suppressPackageStartupMessages(library(ExpectSEE))
set.seed(20261102)
n <- 360L
tau <- 0.80
Y <- matrix(0, n, 3L, dimnames = list(NULL, c("A", "B", "C")))
innov <- matrix(rnorm(n * 3L, sd = 0.01), n, 3L)
innov[, 2L] <- innov[, 2L] + 0.3 * innov[, 1L]
innov[, 3L] <- innov[, 3L] + 0.2 * innov[, 1L]
for (t in 2:n) {
  Y[t, ] <- 0.15 * Y[t - 1L, ] +
    0.05 * Y[t - 1L, c(3L, 1L, 2L)] + innov[t, ]
}

# Fixed-dimensional ABSQ fits and generated-regressor HAC covariance.
s1 <- sals(Y, spec = "ABSQ", tau = tau, q = 1L, hac_lag = 4L)
s2 <- sfgals(s1, se = "generated", hac_lag = 4L)
show_fit <- function(fit, label) {
  cat("\n", label, "\n", sep = "")
  print(head(fit$coef))
  print(fit$gof[, c("n", "p_effective", "loss_mean", "R2", "adjR2")])
  print(round(cor(fit$resid), 3L))
}
show_fit(s1, "SALS: coefficients, fit summaries, residual correlations")
show_fit(s2, "SFGALS: coefficients, fit summaries, residual correlations")

# These tests apply only to the fixed-dimensional fit.
for (against in c("AB", "SQ", "ABP", "ABN")) {
  print(see_spec_test(s2, against = against, se = "generated"))
}
print(see_wald_test(s2, equation = "A", pattern = "^resid_", se = "generated"))
terms_A <- s2$term_names[[1L]]
R <- matrix(0, ncol(Y), length(terms_A), dimnames = list(colnames(Y), terms_A))
for (j in colnames(Y)) {
  R[j, paste0("L1_", j, "_plus2")] <- 1
  R[j, paste0("L1_", j, "_minus2")] <- -1
}
print(see_linear_test(s2, equation = "A", R = R, se = "generated"))

# Direct LASSO in both stages. Intercepts are not penalized.
splits <- see_ts_splits(n - 1L, initial = 160L, assess = 40L, step = 40L,
                        type = "expanding_window")
stopifnot(all(vapply(splits, function(s) max(s$train) < min(s$test), logical(1))))
h1 <- hdsals(Y, spec = "ABSQ", tau = tau, q = 1L,
              coefficient_fit = "lasso", lambda_choice = "lambda.min",
              standardize = TRUE, cv = "expanding_window", ts_splits = splits,
              initial = 160L, assess = 40L, step = 40L, nlambda = 100L)
h2 <- hdsfgals(h1, coefficient_fit = "lasso", lambda_choice = "lambda.min",
                se = "none", standardize = TRUE, cv = "expanding_window",
                ts_splits = splits, initial = 160L, assess = 40L, step = 40L,
                nlambda = 100L, nested_residual_cv = TRUE,
                stage2_lag_candidates = "full", stage2_penalty = "all")
show_fit(h1, "HDSALS: coefficients, fit summaries, residual correlations")
show_fit(h2, "HDSFGALS: coefficients, fit summaries, residual correlations")
print(h1$support)           # Stage-1 selected lag terms
print(h2$stage2_support)    # Stage-2 selected lag and residual terms
print(h2$edges)
print(subset(h1$lambda_path, selected))
print(subset(h2$lambda_path, selected))
stopifnot(h2$coefficient_fit == "lasso", isTRUE(h2$nested_residual_cv),
          h2$stage2_lag_candidates == "full", h2$stage2_penalty == "all")

# Point responses around a verified locally attracting fixed point.
# Failure to find such a root is a diagnostic: do not silently change centering.
system <- see_system_map(h2)
print(system$diagnostics)
irfe <- see_irfe(h2, source = "A", shock = 0.01, sign = "both", horizon = 5L,
                 center = "fixed_point", ci = FALSE, divergence = "error")
stopifnot(all(irfe$path_status == "finite"), all(is.finite(irfe$irfe)),
          all(irfe$fixed_point_residual < 1e-8),
          all(irfe$fixed_point_spectral_radius < 1),
          !any(irfe$inference_available))
print(unique(irfe[, c("center", "fixed_point_residual", "fixed_point_spectral_radius")]))
print(irfe[, c("source", "sign", "target", "horizon", "irfe")])
cat("\nSynthetic example completed successfully.\n")
print(c(ExpectSEE = as.character(packageVersion("ExpectSEE")),
        SALES = as.character(packageVersion("SALES"))))
print(sessionInfo())

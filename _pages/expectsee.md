---
permalink: /expectsee/
title: "ExpectSEE"
author_profile: false
---

## Systems of equations for expectiles

ExpectSEE is an R package for the estimators in Chuang, Chuang, and Du (2026), *Estimating (High-Dimensional) Systems of Equations for Expectiles*. It estimates fixed-dimensional and sparse systems, accounts for contemporaneous dependence through generated residuals, and constructs impulse responses from the fitted system.

[Download ExpectSEE 0.2.11](/files/expectsee/ExpectSEE_0.2.11.tar.gz) · [Download the example](/files/expectsee/paper_example.R) · [Citation and contact](#citation-and-contact)

## Installation

The example is tested with R 4.5.1 and SALES 1.0.0. Install the archived SALES version first, then ExpectSEE:

```r
install.packages(
  "https://cran.r-project.org/src/contrib/Archive/SALES/SALES_1.0.0.tar.gz",
  repos = NULL, type = "source"
)
install.packages(
  "https://hcchuang.github.io/files/expectsee/ExpectSEE_0.2.11.tar.gz",
  repos = NULL, type = "source"
)
library(ExpectSEE)
```

SALES contains compiled code, so installation from source requires the appropriate R build tools, including a Fortran compiler. Skip its installation if SALES 1.0.0 is already installed. ExpectSEE itself contains R code only. SALES implements the sparse asymmetric least-squares method of Gu and Zou (2016); see the [SALES package page](https://CRAN.R-project.org/package=SALES).

## Functions used in the paper

| Task | Functions | Main output |
|:--|:--|:--|
| Fixed-dimensional estimation | `sals()`, `sfgals()` | Coefficients, residuals, goodness of fit, and generated-regressor covariance |
| Sparse estimation | `hdsals()`, `hdsfgals()` | Direct LASSO coefficients, selected terms, and validation-loss paths |
| Expanding-window validation | `see_ts_splits()` | Time-ordered training and validation indices |
| Restricted specifications | `see_spec_test()` | Equation-level tests against unrestricted ABSQ |
| Coefficient-block restrictions | `see_wald_test()` | Wald tests, including generated-residual exclusion |
| General linear restrictions | `see_linear_test()` | Wald tests for a supplied restriction matrix, including symmetry |
| System mapping and responses | `see_system_map()`, `see_irfe()` | Reduced-system components and point impulse responses |

Fixed-dimensional tests use the generated-regressor covariance estimator. They are not applied to the penalized estimates. Coefficient and residual-network figures are assembled from the fitted objects by separate analysis code; the package does not provide the paper's plotting layout.

## A complete example

The downloadable script demonstrates **every function listed above** using one synthetic three-series panel. It requires no bank data or local project files and does not reproduce the paper's empirical numbers.

```r
example_file <- tempfile(fileext = ".R")
download.file(
  "https://hcchuang.github.io/files/expectsee/paper_example.R",
  example_file, mode = "wb"
)
source(example_file)
```

The script proceeds in four steps:

1. Estimate SALS and SFGALS; inspect coefficients, goodness of fit, and residual correlations.
2. Test restricted specifications, generated-residual exclusion, and volatility symmetry with a restriction matrix.
3. Estimate HDSALS and HDSFGALS using expanding-window validation, 100 penalty candidates, and `lambda.min`. Stage 2 reconstructs Stage-1 residuals within each outer training window and retains all lag candidates. Both stages report direct LASSO coefficients.
4. Construct the reduced system and calculate positive and negative impulse responses around a verified locally attracting fixed point. The example requests point responses only and checks that the resulting paths are finite.

For a short demonstration, the script uses an expectile level of 0.80, 160 initial training outcomes, and 40-outcome validation blocks and steps. These are **demonstration settings**. The paper uses 0.99855; its broad samples use 156 initial training outcomes and 26-week blocks, while its shorter samples have separate settings described in the penalty-selection appendix.

Within each LASSO fit, nonconstant regressors are standardized using its training observations. Returned coefficients are in original units. Stage-2 validation constructs generated residuals using contemporaneous outcomes. Selected residual links describe conditional contemporaneous dependence, not causal spillovers.

The paper's fixed points are selected using additional search and verification code. The example uses the package's built-in solver; it does not reproduce that empirical root search.

## Citation and contact

Chuang, Hui-Ching, O-Chia Chuang, and Zaichao Du (2026). *Estimating (High-Dimensional) Systems of Equations for Expectiles*. Working paper.

```bibtex
@unpublished{ChuangChuangDu2026SEE,
  author = {Chuang, Hui-Ching and Chuang, O-Chia and Du, Zaichao},
  title = {Estimating (High-Dimensional) Systems of Equations for Expectiles},
  year = {2026},
  note = {Working paper}
}
```

Package contributors: Hui-Ching Chuang, O-Chia Chuang, Zaichao Du, and Zhenhong Huang. ExpectSEE is distributed under the MIT license; SALES is a separate dependency with its own license.

**Correspondence and package maintenance:** Hui-Ching Chuang, Department of Statistics, National Taipei University. [hcchuang@mail.ntpu.edu.tw](mailto:hcchuang@mail.ntpu.edu.tw)

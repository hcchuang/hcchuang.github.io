---
permalink: /
title: "About Me"
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

<style>
/* ─── toggle layout ──────────────────────────────────────────── */
details .abstract-body {
  margin-left: 1.5rem;     /* ← tweak indent if you like */
}

/* ─── optional flair: cursor + triangles ─────────────────────── */
details summary { cursor:pointer; list-style:none; }
details summary::-webkit-details-marker { display:none; }

</style>

Hui-Ching Chuang is an Associate Professor in the Department of Statistics at
National Taipei University. Her research interests encompass machine learning
applications, natural language processing, econometrics, and investment.
[\[cv\]](/files/cv_hcc_202505.pdf){:target="_blank"}

## WORKING PAPERS
1. _Revisiting the Missing R&D-Patent Relation: Challenges and Solutions for Firm Fixed Effects Models_(with Po-Hsuan Hsu, Chung-Ming Kuan, and Jui-Chung Yang)[\[ssrn\]](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4636846){:target="_blank"}[\[slide\]](/files/MissingRDPatentFE_Slide.pdf){:target="_blank"}[\[code\]](https://github.com/hcchuang/Revisiting-the-Missing-RD-Patent-Relation_Challenges-and-Solutions-for-Firm-Fixed-Effects-Models){:target="_blank"}  
   <small>The SFS Cavalcade Asia-Pacific 2024; 2024 UC Davis-FMA Napa Finance Conference; Max Planck I&amp;E Seminar*; 16th NYCU Finance Conference (Keynote)*; 2024 FMA Asia Pacific Conference**. (Presented by <em>Po-Hsuan Hsu</em>)</small>

   <details>
     <summary>Abstract</summary>
     <div class="abstract-body">
     
 The common practice of including firm fixed effects in empirical researzch
       may eliminate the explanatory power of important economic factors that are
       persistent. We use the intuitive R&amp;D–patent relation to illustrate
       this point. Our review of recent studies suggests a surprising pattern:
       R&amp;D input positively explains patent output in only half of prior
       regression estimations. This “missing link” can be attributed to the
       persistence of R&amp;D and patents, which allows between-firm variation
       to be absorbed by firm dummies. We consider adjusted Hausman–Taylor
       estimates and advanced machine-learning methods, both of which restore a
       clear positive R&amp;D–patent relation. Notably, ML models reveal that
       only 10-20 % of firm dummies are informative; including the rest biases
       identification. The paper offers two ready-to-use econometric “second
       opinions” for researchers dealing with explanatory variables that strongly
       correlate with between-individual unobservables.
    </div>
   </details>

2. _Classifying Hedge Fund Strategies with Large Language Models: Systematic vs. Discretionary Performance_  
   (with Chung-Ming Kuan)[\[paper\]](/files/ManMachineHFR_20250420.pdf){:target="_blank"}[\[slide\]](/files/ManMachineHFR_slide.pdf)  
   <small>European Financial Management Association 2025 Annual Meeting, Greece; Quantitative Finance Workshop 3 (Asset Pricing &amp; Risk Management), IMS-NUS, Singapore; 26th Conference on the Theories and Practices of Securities and Financial Markets.</small>

   <details>
     <summary>Abstract</summary>
     <div class="abstract-body">
       We fine-tune FinBERT, a finance-specific large language model, to classify
       hedge funds as systematic or discretionary. Removing manual subjectivity
       yields cleaner style labels and reveals that systematic funds, on average,
       generate higher factor-adjusted returns than discretionary funds. After
       a false-discovery-rate adjustment, 10-20 % of funds still show
       statistically significant positive alphas in models that include both
       observable and latent risk factors.
     </div>
   </details>

4. _What Share of Patents Is Commercialized?_(with Po-Hsuan Hsu, You-Na Lee, and John P. Walsh)  
   <small>TPRI Brownbag Seminar*; NBER Productivity Seminar*; Max Planck I&amp;E Seminar*; TES 2023; Academia Sinica; NTU; NTPU; YZU. (*Presented by John P. Walsh)</small>

   <details>
     <summary>Abstract</summary>
     <div class="abstract-body">
       Using three independent inventor surveys as labeled data, we combine
       contextual embeddings (BERT for Patents) with bibliometric indicators to
       build machine-learning models that estimate, over time and at scale, the
       probability that a US patent is commercially exploited. The approach
       reveals commercialization rates across technologies and cohorts that were
       previously impossible to observe.
     </div>
   </details>

5. _Assessing Risk Spillovers with (Lasso) VAR for Expectile_(with O-Chia Chuang, Zaichao Du, and Zhenhong Huang)  
   <small>28th Conference on the Theories and Practices of Securities and Financial Markets; NTU; TFA 2020; TES 2020; 6th Annual Meeting of Young Econometricians in Asia-Pacific*. (Presented by <em>O-Chia Chuang</em>)</small>

   <details>
     <summary>Abstract</summary>
     <div class="abstract-body">
       We generalize the vector autoregressive (VAR) model from conditional means
       to conditional expectiles (MCARE) for assessing risk spillovers among
       multiple entities. For high-dimensional systems, we impose an 
       <em>L<sub>1</sub></em> penalty (L-MCARE). Applied to the return network of
       global systemically important banks, MCARE and L-MCARE uncover
       time-varying tail-risk transmission patterns.
     </div>
   </details>

## PUBLISHED PAPERS
1. Jui-Chung Yang, Hui-Ching Chuang, and Chung-Ming Kuan (2020).“Double Machine Learning with Gradient Boosting and Its Application to the Big N Audit Quality Effect.” _Journal of Econometrics_, 216 (1), 268-283.  

2. O-Chia Chuang, Hui-Ching Chuang, Zixuan Wang, and Jin Xu (2024).“Profitability of Technical Trading Rules in the Chinese Stock Market.” _Pacific-Basin Finance Journal_, 84, 102278.  

3. Yin-Siang Huang, Hui-Ching Chuang, Iftekhar Hasan, and Chih-Yung Lin (2024).“Search Symbols, Trading Performance, and Investor Participation.”_International Review of Economics and Finance_, 92, 380-393.  

4. Yin-Siang Huang, Hui-Ching Chuang, Iftekhar Hasan, and Chih-Yung Lin (2021).“The Effect of Language on Investing: Evidence from Searches in Chinese versus English.”_Pacific-Basin Finance Journal_, 67, 101553.  

5. Hui-Ching Chuang and Chung-Ming Kuan (2020).“Identifying and Assessing Superior Mutual Funds: An Application of the New Step-wise Data-Snooping-Bias-Free Test.”_Review of Securities &amp; Futures Markets_, 32 (1), 1-32.  

6. Hui-Ching Chuang and Chung-Ming Kuan (2010).“Testing the Performance of Taiwan Mutual Funds Based on the Tests without Data-Snooping Bias.”_Review of Securities &amp; Futures Markets_, 22 (3), 181-206.  

7. Hui-Ching Chuang and Jauer Chen (2023).“Exploring Industry-Distress Effects on Loan Recovery: A Double Machine Learning Approach for Quantiles.”_Econometrics_, 11 (6).  

8. Hui-Ching Chuang and Jui-Chung Yang (2022).“Dynamic Panel Data Estimators in Leverage Adjustments Model.”_Advances in Financial Planning and Forecasting_, 10, 67-111.

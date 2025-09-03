// Appendice 3

data {
  int n;                                                  // Nombre d’observations
  vector[n] y;                                            // Deltas mesurés pour les étalons
  vector<lower=0>[n] uy;                                  // Incertitudes-types de y
  vector[n] nuy;                                          // Nombre de degrés de liberté associés à uy
  vector[n] x;                                            // Deltas calibrés pour les étalons
  vector<lower=0>[n] ux;                                  // Incertitudes-tyes de x
  vector[n] nux;                                          // Nombre de degrés de liberté associés à ux
  vector[2] betaM;                                        // Moyennes a priori de beta
  vector[2] betaS;                                        // Ecarts-types a priori de beta
  vector[n] etaM;                                         // Moyennes a priori de eta
  vector<lower=0>[n] etaS;                                // Ecarts-types a priori de eta
  real<lower=0> gammax;                                   // Médiane a priori de taux
  real<lower=0> gammay;                                   // Médiane a priori de tauy
  real<lower=0> alphax2;                                  // Médiane a priori de sigmax2
  real<lower=0> alphay2; }                                // Médiane a priori de sigmay2

transformed data {
  vector<lower=0>[n] ux2;
  vector<lower=0>[n] uy2;
  ux2 = square(ux);
  uy2 = square(uy); }

parameters {
  vector[2] beta;                                         // Coefficients de régression
  vector[n] eta;                                          // Valeurs vraies des deltas mesurés
  real<lower=0> taux;                                     // Dark uncertainty des deltas mesurés
  real<lower=0> tauy;                                     // Dark uncertainty des deltas mesurés
  vector<lower=0, upper=2>[n] sigmax2;                    // Variances des erreurs sur x
  vector<lower=0, upper=0.2>[n] sigmay2; }                // Variances des erreurs sur y

transformed parameters {
  vector[n] xi;                                           // Valeurs vraies des deltas calibrés
  vector<lower=0> [n] lambdax;                            // Taux des vraisemblances gamma pour ux2
  vector<lower=0> [n] lambday;                            // Taux des vraisemblances gamma pour uy2
  xi = beta[1] + beta[2] * eta;                           // Valeur vraie de x
  lambdax = nux ./ (2 * sigmax2);
  lambday = nuy ./ (2 * sigmay2); }

model {
  beta ~ normal(betaM, betaS);                            // Loi a priori de beta
  taux ~ cauchy(0, gammax);                               // Loi a priori de taux
  tauy ~ cauchy(0, gammay);                               // Loi a priori de tauy
  eta ~ normal(etaM, etaS);                               // Loi a priori de eta
  sigmax2 ~ cauchy(0, alphax2);                           // Loi a priori de sigmax2
  sigmay2 ~ cauchy(0, alphay2);                           // Loi a priori de sigmay2
  for (i in 1:n) {
    real sigma_i = sqrt(sigmax2[i] + square(taux));
    if (sigma_i < 1e-8) {
      print("ERREUR : sigma[", i, "] = ", sigma_i);
      reject("sigma[", i, "] is too small.");
    }
  }
  x ~ normal(xi, sqrt(sigmax2 + square(taux)));           // Vraisemblance de x
  y ~ normal(eta, sqrt(sigmay2 + square(tauy)));          // Vraisemblance de y
  for (i in 1:n) {
    real beta_i = lambdax[i];
    if (beta_i < 1e-9) {
      print("ERREUR : beta[", i, "] = ", beta_i);
      reject("beta[", i, "] is too small.");
    }
  }
  ux2 ~ gamma(nux/2, lambdax);                            // Vraisemblance de ux2
  uy2 ~ gamma(nuy/2, lambday); }                          // Vraisemblance de uy2
  

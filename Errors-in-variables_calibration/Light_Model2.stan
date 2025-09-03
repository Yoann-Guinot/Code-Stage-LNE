// Model2 sans dark uncertainty

data {
  int n;                                                  // Nombre d’observations
  vector[n] y;                                            // Deltas mesurés pour les étalons
  vector<lower=0>[n] uy;                                  // Incertitudes-types de y
  vector[n] nuy;                                          // Nombre de degrés de liberté associés à uy
  vector[n] x;                                            // Deltas calibrés pour les étalons
  vector<lower=0>[n] ux;                                  // Incertitudes-types de x
  vector[n] nux;                                          // Nombre de degrés de liberté associés à ux
  vector[2] betaM;                                        // Moyennes a priori de betas
  vector[2] betaS;                                        // Ecarts-types a priori de betas
  vector[n] etaM;                                         // Moyennes a priori de eta
  vector<lower=0>[n] etaS;                                // Ecarts-types a priori de eta
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
  vector<lower=0>[n] sigmax2;                             // Variances des erreurs sur x
  vector<lower=0>[n] sigmay2; }                           // Variances des erreurs sur y

transformed parameters {
  vector[n] xi;                                           // Valeurs vraies des deltas calibrés
  vector<lower=0> [n] lambdax;                            // Taux des vraisemblances gamma pour ux2
  vector<lower=0> [n] lambday;                            // Taux des vraisemblances gamma pour uy2
  xi = beta[1] + beta[2] * eta;                           // Valeur vraie de x
  lambdax = nux ./ (2 * sigmax2);
  lambday = nuy ./ (2 * sigmay2); }

model {
  beta ~ normal(betaM, betaS);                            // Loi a priori de beta
  eta ~ normal(etaM, etaS);                               // Loi a priori de eta
  sigmax2 ~ cauchy(0, alphax2);                           // Loi a priori de sigmax2
  sigmay2 ~ cauchy(0, alphay2);                           // Loi a priori de sigmay2
  x ~ normal(xi, sqrt(sigmax2));                          // Vraisemblance de x
  y ~ normal(eta, sqrt(sigmay2 ));                        // Vraisemblance de y
  ux2 ~ gamma(nux/2, lambdax);                            // Vraisemblance de ux2
  uy2 ~ gamma(nuy/2, lambday); }                          // Vraisemblance de uy2
  

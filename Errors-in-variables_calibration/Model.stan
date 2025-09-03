// Appendice 2

data {
 int n;                                                  // Nombre de résultats de mesure
 vector<lower=0>[n] y;                                   // Fractions molaires
 vector<lower=0>[n] uy;                                  // Incertitudes-types des fractions molaires
 vector<lower=0>[n] x;                                   // Ratios
 vector<lower=0>[n] ux;                                  // Incertitudes-types des ratios
 vector[2] betaM;                                        // Moyennes a priori de beta
 vector[2] betaS;                                        // Ecarts-types a priori de beta
 vector<lower=0>[n] xiM;                                 // Moyennes a priori de xi
 vector<lower=0>[n] xiS;                                 // Ecarts-types a priori de xi
 real<lower=0> gammay; }                                 // Médiane a priori de la dark uncertainty

parameters { 
 vector[2] beta;                                         // Coefficients de régression
 vector[n] xi;                                           // Valeurs moyennes des ratios
 real<lower=0> tauy; }                                   // Dark uncertainty

transformed parameters {
 vector[n] eta;                                          // Valeurs moyennes des fractions molaires
 eta = beta[1] + beta[2] * xi; }
 
model {
 beta ~ normal(betaM, betaS);                            // Loi a priori de beta
 tauy ~ cauchy(0, gammay);                               // Loi a priori de la dark uncertainty
 xi ~ normal(xiM, xiS);                                  // Loi a priori de xi
 x ~ normal(xi, ux);                                     // Vraisemblance des ratios
 y ~ normal(eta, sqrt(uy .* uy + tauy^2)); }             // Vraisemblance des fractions molaires
 

// Model sans dark uncertainty

data {
 int n;                                                  // Nombre de résultats de mesure
 vector<lower=0>[n] y;                                   // Fractions molaires
 vector<lower=0>[n] uy;                                  // Incertitudes-types des fractions molaires
 vector<lower=0>[n] x;                                   // Ratios
 vector<lower=0>[n] ux;                                  // Incertitudes-types des ratios
 vector[2] betaM;                                        // Moyennes a priori de beta
 vector[2] betaS;                                        // Ecarts-types a priori de beta
 vector<lower=0>[n] xiM;                                 // Moyennes a priori de xi
 vector<lower=0>[n] xiS; }                               // Ecarts-types a priori de xi

parameters { 
 vector[2] beta;                                         // Coefficients de régression
 vector[n] xi; }                                         // Valeurs moyennes des ratios
 
transformed parameters {
 vector[n] eta;                                          // Valeurs moyennes des fractions molaires
 eta = beta[1] + beta[2] * xi; }
 
model {
 beta ~ normal(betaM, betaS);                            // Loi a priori de beta
 xi ~ normal(xiM, xiS);                                  // Loi a priori de xi
 x ~ normal(xi, ux);                                     // Vraisemblance des ratios
 y ~ normal(eta, uy); }                                  // Vraisemblance des fractions molaires
 

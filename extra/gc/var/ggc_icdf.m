function icdf = ggc_icdf(nx,nz,p,m,N)

% Return handle to inverse CDF function for GGC F-statistic
%
% NOTE: Only the F-test works here - we cannot use the LR test because
% the least-squares model parameters in this case are not ML parameters,
% and we don't know how to estimate those!

assert(m > p,'Insufficient observations for statistical test');
M = N*(m-p) % effective number of observations
n = nx+nz;
pn = p*n;
assert(M > pn,'Insufficient observations for F-test');
d = p*nx*(nx-1);
d2 = nx*(M-pn);
sf = d2/d;  % F scaling factor
icdf = @(prob) finv(prob,d,d2)/sf; % anonymous function handle to CDF

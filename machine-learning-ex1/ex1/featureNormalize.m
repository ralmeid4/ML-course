function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       
sigma=std(X);
mu=mean(X);
% iterative version:

%for j=1:size(X_norm,2)
%	X_norm(:,j)=(X_norm(:,j)-mu(j))/sigma(j);
%end

% vectorized version

mu_matrix=ones(size(X,1),1) * mu;
sigma_matrix=ones(size(X,1),1) * sigma;
X_norm=X_norm-mu_matrix;
X_norm=X_norm./sigma_matrix;

% both approaches work well but they can't be used after the initial column of 1's has been added to X (stddev will be zero for that column), otherwise it will be replaced by NaN values.

% ============================================================

end

function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% range = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
% error_matrix=zeros(size(range),size(range));

% for i=1:size(range)
	% for j=1:size(range)
		% C=range(i);
		% sigma=range(j);
		% model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		% predictions=svmPredict(model,Xval);
		% error_matrix(i,j)=mean(double(predictions ~= yval))
	% end
% end
% [smallest_error,ind]=min(error_matrix(:))
% [ind_c,ind_sig]=ind2sub(size(error_matrix),ind)
% C=range(ind_c)
% sigma=range(ind_sig)

% the above works well to find the combination of C and sigma that give with smallest cv error - skipping to solutions to speed up submission:
C = 1;
sigma = 0.1;

% =========================================================================

end

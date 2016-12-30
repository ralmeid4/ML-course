function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% regularized cost function code from previous weeks
h=X*theta; % linear regression hypothesis is the product \theta^T*X 
costreg=(h-y).^2; % formula for J for linear regression 
J=(1/(2*m)*sum(costreg)) + (lambda/(2*m))*sum(theta(2:end,1).^2); % finalizing J with the regularization term

% regularized grad code from previous weeks

grad=(1/m)*(X'*(h-y)); % single line calculation of gradient (would have to be multiplied by alpha to calculate adjustment to theta value)
grad_reg=zeros(size(grad));
grad_reg(2:end,1)=(lambda/m)*theta(2:end,1);
grad=grad+grad_reg;












% =========================================================================

grad = grad(:);

end

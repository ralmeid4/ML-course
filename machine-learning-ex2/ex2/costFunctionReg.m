function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h=sigmoid(X*theta); % logistic regression hypothesis is the  sigmoid of \theta^T*X 
costreg=(y'*-1)*log(h)-(1-y')*(log(1-h)); % formula for J for logistic regression (transposed y in order to multiply with h) 
J=(1/(m)*sum(costreg)) + (lambda/(2*m))*sum(theta(2:size(theta),1).^2); % finalizing J with the regularization term
grad=(1/m)*(X'*(h-y)); % single line calculation of gradient (would have to be multiplied by alpha to calculate adjustment to theta value
grad_reg=zeros(size(grad));
grad_reg(2:size(grad),1)=(lambda/m)*theta(2:size(theta),1);
grad=grad+grad_reg;





% =============================================================

end

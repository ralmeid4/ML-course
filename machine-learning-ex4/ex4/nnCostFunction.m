function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



% Calculating h by forward propagation
a1 = [ones(m, 1) X];
z2=a1*Theta1';
a2=sigmoid(z2);
a2= [ones(m, 1) a2];
z3=a2*Theta2';
a3=sigmoid(z3);

%% Calculating cost with for loops and also backpropagation
%temp_cost=0;
%for i=1:m
%	y_temp=zeros(num_labels,1);
%	y_temp(y(i))=1; % Recode y into binary
	% delta_3=zeros(num_labels,1);
	% delta_2=zeros(hidden_layer_size,1);
	% for k=1:num_labels
		% y_temp=(y==k);
		% temp_cost=temp_cost+(-1*y_temp(k,1)*log(hypothesis(i,k))-(1-y_temp(k,1))*log(1-hypothesis(i,k)));
		% delta_3(k,1)=hypothesis(i,k)-y_temp(k);	
		% end
	% delta_2=(Theta2(:,2:end)'*delta_3).*(sigmoidGradient(X(i,:)*Theta1'))'; % unsure of transposing the sigmoid gradient (ALL WRONG)
	% Delta_1=Delta_1+delta_2*(X(1,:)';
	% end	
%J=(1/m)*temp_cost;


% The for loop code above could calculate cost but it was becoming very messy for backpropagation
% Going for the vectorized implementation suggested in the online tutorial

y_matrix=eye(num_labels)(y,:);

cost_matrix=(-1*y_matrix).*log(a3)-(1-y_matrix).*log(1-a3);
J=sum(sum(cost_matrix))/m;
% it works! and it's sooo much simpler...

% code below is unchanged from earlier
square_Theta1=Theta1.^2;
square_Theta2=Theta2.^2;
reg_cost=(lambda/(2*m))*(sum(sum(square_Theta1(:,2:end)))+sum(sum(square_Theta2(:,2:end))));
J=J+reg_cost;

% now for vectorized backpropagation	

d3=a3-y_matrix;
d2=d3*Theta2(:,2:end).*sigmoidGradient(z2);
Delta1=d2'*a1;
Delta2=d3'*a2;
Theta1_grad=Delta1/m;
Theta2_grad=Delta2/m;

% For regularization, I am editing the Theta1 and Theta2 matrices since I've already calculated everything else I needed from them at this point
Theta1(:,1)=0;
Theta2(:,1)=0; % this ensures that the theta values corresponding to bias units are removed from the regularization calculations
Theta1=(Theta1.*lambda)./m;
Theta2=(Theta2.*lambda)./m;

Theta1_grad=Theta1_grad+Theta1;
Theta2_grad=Theta2_grad+Theta2;








% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end

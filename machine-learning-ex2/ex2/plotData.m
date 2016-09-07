function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% in order to color the data points depending on one feature or variable (in this case, based on y), we must first find the indices of entries that comply to one or other category
pos=find(y==1); % finds indices for y=1 category entries
neg=find(y==0); % finds indices for y=0 category entries
% now plot only the positive values
plot(X(pos,1), X(pos,2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
% and also the negative values using a different style and color
plot(X(neg,1), X(neg,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
ylabel('Exam 2 score'); % Set the y axis label
xlabel('Exam 1 score'); % Set the x axis label








% =========================================================================



hold off;

end

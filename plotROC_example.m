% Generate a distribution of the sufficient statistic
% x_0 is the data when H_0 is true 
%   Here, H_0 is that x is Gaussian mean=0, std=1
% x_1 is the data when H_1 is true
%   Here, H_1 is that x is Gaussian mean=2, std=1
x_0 = randn(1,100);
x_1 = randn(1,604) + 2;

% Compute and plot the ROC curve
h = computeROC(x_0, x_1);


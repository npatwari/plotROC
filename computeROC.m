function h = computeROC(x_0, x_1)
%
% Author(s): Neal Patwari 14 July 2020
%
% Inputs: the value of the statistic (on which the detector
%         is based) under H0 and under H1.
% 
% Outputs: The handle to the plot.
%
% License: see LICENSE.md
%


% Convert inputs to vectors (in case matrices are input)
input0    = x_0(:);
input1    = x_1(:);
len0      = length(input0);
len1      = length(input1);

% Sorting produces the x-values in the complementary
% cumulative distribution function (CCDF)
sorted_x0 = sort(input0);
sorted_x1 = sort(input1);

% Calculate the y-values in the CCDF.  Rather than going
% from 1 down to 0, we count down from 1-ep/2 to ep/2 
% to account for the fact that we never really have a 
% probability of detection or false alarm of 0 or 1 with
% a finite quantity of data points.
ep0       = 1.0/len0;
ep1       = 1.0/len1;
ccdf0     = 1-ep0/2:-ep0:ep0/2;
ccdf1     = 1-ep1/2:-ep1:ep1/2;

% We need a probability of false alarm (p_FA) vector that
% is aligned with the CCDF for H_1 (ccdf1).  p_FA(i) answers
% the question, what is the probability of false alarm at
% the same threshold that produces a probability of detection 
% of ccdf1(i)?  The value sorted_x1(i) is the threshold for 
% which results in ccdf1(i) probability of detection. 
% This same threshold would result in a p_FA(i) value 
% equal to the proportion of values in H_0 > it.
for i = 1:len1
    temp = find(sorted_x1(i) < sorted_x0);
    if isempty(temp)
        p_FA(i) = ccdf0(end);
    else
        p_FA(i) = ccdf0(temp(1));
    end
end

% Plot the ROC curve: P[False Alarm] vs. P[Detection]
h = plot(p_FA, ccdf1, 'r-o', 'LineWidth',2);
set(gca, 'FontSize',18);
grid('on');
xlabel('Probability of False Alarm');
ylabel('Probability of Detection');

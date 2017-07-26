function [a3,delta] = callGeometry(platSize)
%Function to calculate certain geometric values of the manipulator


a3 = sqrt((0.5*platSize(1))^2+(0.5*platSize(2))^2);
delta = [atan2(platSize(2),platSize(1)),atan2(platSize(2),-platSize(1)),...
    atan2(-platSize(2),-platSize(1)),atan2(-platSize(2),platSize(1))];

end

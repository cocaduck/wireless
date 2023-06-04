n = 16;                                                % array size (number of antenna in TRX)
theta1 = 40;                                           % the array response of signal 1 (in degree)
theta2 = 120;                                          % the array response of signal 2 (in degree)
a = @(theta) (exp(-j*(0:n-1).'*theta*pi/180));         % the lambda function of a basic array response

angle = linspace(0,180,100);                           % angles for measuring the power for the signal
for ii = 1 : numel(angle)                              % iterate through all angles
    response1(ii) = abs(a(angle(ii))'*a(theta1))/n;    % calculate the power for each angle (by inner products)
    response2(ii) = abs(a(angle(ii))'*a(theta2))/n;
end

hold on;                                               % plot the results
plot(angle, response1, 'r', 'linewidth', 3)
plot(angle, response2, 'b', 'linewidth', 3)
xlabel('Degree');
ylabel('Power');
ylim([0 1.2]);
legend({'Signal 1 Response', 'Signal 2 Response'})
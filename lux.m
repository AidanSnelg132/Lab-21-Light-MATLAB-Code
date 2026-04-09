M = readmatrix('nightlux.txt', 'Delimiter', ':');

% Extract columns
time = M(:,1);
measurements = M(:,2);

% Compute average
nightAvg = mean(measurements);

% Create a smoothed curve (moving average)
smoothMeasurements = movmean(measurements, 300); 
% 300 means averaging over 300 points (5 min if data is every second)

figure

% Raw data
plot(time, measurements, '-', 'LineWidth', 0.7)
hold on

% Smoothed average curve
plot(time, smoothMeasurements, 'LineWidth', 2.5)

% Horizontal line for full-night average
yline(nightAvg, '--', 'LineWidth', 1.5)

% Labels and title
xlabel('Time (s)')
ylabel('Illuminance (lux)')
title('Ambient Light Over Time')
grid on

% Optional axis limits
xlim([min(time) max(time)])

% Legend
legend('Raw Data', 'Smoothed Curve', 'Night Average', 'Location', 'best')

% Add average value in top-right corner
xText = max(time) * 0.75;
yText = max(measurements) * 0.95;
text(xText, yText, sprintf('Night Average = %.3f lux', nightAvg), ...
    'FontSize', 11, ...
    'BackgroundColor', 'white', ...
    'EdgeColor', 'black', ...
    'Margin', 6)

hold off
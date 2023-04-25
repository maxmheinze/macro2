%%% Macroeconomics assignment 1

title = 'Advanced Macroeconomics 2 Assignment 1';
author = 'Tim Koenders and Max Heinze';
fprintf('%s\n%s\n\n', title, author);

%% Question 1

% Read in macroeconomic data from an Excel file and prepare data
data=readtable("Data_Macro2_France.xlsx");
data.Year=datetime(data.TIME,'InputFormat','uuuu-QQQ','Format','uuuu-QQQ');
data_timetable = table2timetable(data, 'RowTimes', 'Year');
Y = data.GDP;
C = data.HouseholdConsumption;
I = data.CapitalFormation;
G = data.GovernmentConsumption;
Year = data.Year;
C = rmmissing(C);
I = rmmissing(I);
G = rmmissing(G);
% Remove the first 20 years of GDP data to make time series balanced (since they contain missing values)
Y(1:20) = [];
Year(1:20) = [];

%Calculating sample means and plotting the time series
C_Y = C ./ Y;
I_Y = I ./ Y;
G_Y = G ./ Y;
fprintf('Sample means:\n');
fprintf('C/Y: %.4f\n', mean(C_Y));
fprintf('I/Y: %.4f\n', mean(I_Y));
fprintf('G/Y: %.4f\n', mean(G_Y));
figure(1);
plot(data.Year, data.GDP, data.Year, data.HouseholdConsumption, data.Year, data.CapitalFormation, data.Year, data.GovernmentConsumption);
xlabel('Year');
ylabel('Millions of Euros');
legend('GDP', 'Household Consumption', 'Capital Formation', 'Government Consumption');

%% Comment: The time series plot for GDP, household consumption, government expenditure and investment shows the strong correlation between those time series. Consumption, investment, and government expenditure make up for about 52, 22 and 24 percent of GDP, respectively. 

%obtaining the stationary (cyclical) component using the HP filter and plot the cyclical components
lambda = 1600; % set the smoothing parameter
Y_trend = hpfilter(log(Y), lambda);
C_trend = hpfilter(log(C), lambda);
I_trend = hpfilter(log(I), lambda);
G_trend = hpfilter(log(G), lambda);
Y_cycle = log(Y) - hpfilter(log(Y), lambda);
C_cycle = log(C) - hpfilter(log(C), lambda);
I_cycle = log(I) - hpfilter(log(I), lambda);
G_cycle = log(G) - hpfilter(log(G), lambda);
figure(2);
plot(Year, Y_trend, Year, C_trend, Year, I_trend, Year, G_trend);
xlabel('Year');
ylabel('Trend Component')
legend('GDP', 'Household Consumption', 'Capital Formation', 'Government Consumption');

figure(3);
plot(Year, Y_cycle, Year, C_cycle, Year, I_cycle, Year, G_cycle);
xlabel('Year');
ylabel('Cyclical Component') 
legend('GDP', 'Household Consumption', 'Capital Formation', 'Government Consumption');

%% Comment: The trend component of GDP, consumption, investment, and government expenditure is obtained using the HP filter with a smoothing parameter of 1600. The trend component is much smoother than the original time series and captures the long-term trends in the data. The filtered cyclical component is obtained by subtracting the trend from the original series. It represents the short-term variations in the series that are not explained by the trend. Positive values of the cyclical component indicate that the series is above its trend, while negative values indicate that the series is below its trend. From the curves, it appears that investments is the most volatile time series among the four. 

%creating summary table of business cycle stylized facts (full sample)
std_Y_cycle = std(Y_cycle);
std_C_cycle = std(C_cycle);
std_I_cycle = std(I_cycle);
std_G_cycle = std(G_cycle);
fprintf('Standard deviations of cyclical components:\n');
fprintf('Y_cycle: %.4f\n', std_Y_cycle);
fprintf('C_cycle: %.4f\n', std_C_cycle);
fprintf('I_cycle: %.4f\n', std_I_cycle);
fprintf('G_cycle: %.4f\n', std_G_cycle);
Y_rsd = std(Y_cycle) / std(Y_cycle) * 100;
C_rsd = std(C_cycle) / std(Y_cycle) * 100;
I_rsd = std(I_cycle) / std(Y_cycle) * 100;
G_rsd = std(G_cycle) / std(Y_cycle) * 100;
fprintf('Relative Standard Deviations:\n');
fprintf('Y_cycle: %.4f%%\n', Y_rsd);
fprintf('C_cycle: %.4f%%\n', C_rsd);
fprintf('I_cycle: %.4f%%\n', I_rsd);
fprintf('G_cycle: %.4f%%\n', G_rsd);
corr_cyclical = corrcoef([Y_cycle, C_cycle, I_cycle, G_cycle]);
corr_matrix = corrcoef([Y_cycle, C_cycle, I_cycle, G_cycle]);
disp('Contemporaneous Output Correlations of Cyclical Components')
disp('---------------------------------------------------------')
disp('          Y         C         I         G')
disp(corr_matrix)
T = table(std_Y_cycle, std_C_cycle, std_I_cycle, std_G_cycle, Y_rsd, C_rsd, I_rsd, G_rsd, ...
          corr_matrix(1,1), corr_matrix(1,2), corr_matrix(1,3), corr_matrix(1,4), ...
          corr_matrix(2,1), corr_matrix(2,2), corr_matrix(2,3), corr_matrix(2,4), ...
          corr_matrix(3,1), corr_matrix(3,2), corr_matrix(3,3), corr_matrix(3,4), ...
          corr_matrix(4,1), corr_matrix(4,2), corr_matrix(4,3), corr_matrix(4,4), ...
          'VariableNames', {'Std_Y', 'Std_C', 'Std_I', 'Std_G', 'RSD_Y', 'RSD_C', 'RSD_I', 'RSD_G', ...
                            'Corr_Y_Y', 'Corr_Y_C', 'Corr_Y_I', 'Corr_Y_G', ...
                            'Corr_C_Y', 'Corr_C_C', 'Corr_C_I', 'Corr_C_G', ...
                            'Corr_I_Y', 'Corr_I_C', 'Corr_I_I', 'Corr_I_G', ...
                            'Corr_G_Y', 'Corr_G_C', 'Corr_G_I', 'Corr_G_G'});

disp(T)

%% Comment: The first section of the table presents the standard deviations of the cyclical components of the four variables. It shows that investment (I) has the largest standard deviation (0.0302), followed by output (Y) and consumption (C), while government spending (G) has the smallest standard deviation (0.0137). The second section shows the relative standard deviations of the cyclical components (RSDs) of the four variables. The RSD is a measure of the relative volatility of a variable's cyclical component compared to the cyclical component of output. Therefore, in the given data, the RSD of the cyclical component of consumption (C_cycle) is 88.868%, indicating that its volatility is lower than that of output's cyclical component. Similarly, the RSD of the cyclical component of investment (I_cycle) is 170.55%, indicating that its volatility is higher than that of output's cyclical component. 

% Splitting the data into two parts based on the date range
Y_cycle1 = Y_cycle(1:112,:);
C_cycle1 = C_cycle(1:112,:);
I_cycle1 = I_cycle(1:112,:);
G_cycle1 = G_cycle(1:112,:);
Y_cycle2 = Y_cycle(113:end,:);
C_cycle2 = C_cycle(113:end,:);
I_cycle2 = I_cycle(113:end,:);
G_cycle2 = G_cycle(113:end,:);

% Summary table for the "until 2007Q4" sample (hereafter called "subsample 1"
std_Y_cycle1 = std(Y_cycle1);
std_C_cycle1 = std(C_cycle1);
std_I_cycle1 = std(I_cycle1);
std_G_cycle1 = std(G_cycle1);
fprintf('Standard deviations of cyclical components for subsample 1:\n');
fprintf('Y_cycle: %.4f\n', std_Y_cycle1);
fprintf('C_cycle: %.4f\n', std_C_cycle1);
fprintf('I_cycle: %.4f\n', std_I_cycle1);
fprintf('G_cycle: %.4f\n', std_G_cycle1);
Y_rsd1 = std(Y_cycle1) / std(Y_cycle1) * 100;
C_rsd1 = std(C_cycle1) / std(Y_cycle1) * 100;
I_rsd1 = std(I_cycle1) / std(Y_cycle1) * 100;
G_rsd1 = std(G_cycle1) / std(Y_cycle1) * 100;
fprintf('Relative Standard Deviations for subsample 1:\n');
fprintf('Y_cycle: %.4f%%\n', Y_rsd1);
fprintf('C_cycle: %.4f%%\n', C_rsd1);
fprintf('I_cycle: %.4f%%\n', I_rsd1);
fprintf('G_cycle: %.4f%%\n', G_rsd1);
corr_matrix1 = corrcoef([Y_cycle1, C_cycle1, I_cycle1, G_cycle1]);
disp('Contemporaneous Output Correlations of Cyclical Components for subsample 1')
disp('-----------------------------------------------------------------------')
disp('          Y         C         I         G')
disp(corr_matrix1)
T1 = table(std_Y_cycle1, std_C_cycle1, std_I_cycle1, std_G_cycle1, Y_rsd1, C_rsd1, I_rsd1, G_rsd1, ...
          corr_matrix1(1,1), corr_matrix1(1,2), corr_matrix1(1,3), corr_matrix1(1,4), ...
          corr_matrix1(2,1), corr_matrix1(2,2), corr_matrix1(2,3), corr_matrix1(2,4), ...
          corr_matrix1(3,1), corr_matrix1(3,2), corr_matrix1(3,3), corr_matrix1(3,4), ...
          corr_matrix1(4,1), corr_matrix1(4,2), corr_matrix1(4,3), corr_matrix1(4,4), ...
          'VariableNames', {'Std_Y', 'Std_C', 'Std_I', 'Std_G', 'RSD_Y', 'RSD_C', 'RSD_I', 'RSD_G', ...
                            'Corr_Y_Y', 'Corr_Y_C', 'Corr_Y_I', 'Corr_Y_G', ...
                            'Corr_C_Y', 'Corr_C_C', 'Corr_C_I', 'Corr_C_G', ...
                            'Corr_I_Y', 'Corr_I_C', 'Corr_I_I', 'Corr_I_G', ...
                            'Corr_G_Y', 'Corr_G_C', 'Corr_G_I', 'Corr_G_G'});
disp(T1)

%% Comment: The results from subsample 1 again show that investments is the most volatile time series among the four. Furthermore, the correlation between output, consumption and investment is positive indicating the series move procyclical while government consumption appears to move countercyclical with output.

% Summary table for the "from 2008Q1" sample (hereafter called "subsample 2"
std_Y_cycle2 = std(Y_cycle2);
std_C_cycle2 = std(C_cycle2);
std_I_cycle2 = std(I_cycle2);
std_G_cycle2 = std(G_cycle2);
fprintf('Standard deviations of cyclical components for subsample 2:\n');
fprintf('Y_cycle: %.4f\n', std_Y_cycle2);
fprintf('C_cycle: %.4f\n', std_C_cycle2);
fprintf('I_cycle: %.4f\n', std_I_cycle2);
fprintf('G_cycle: %.4f\n', std_G_cycle2);
Y_rsd1 = std(Y_cycle2) / std(Y_cycle2) * 100;
C_rsd1 = std(C_cycle2) / std(Y_cycle2) * 100;
I_rsd1 = std(I_cycle2) / std(Y_cycle2) * 100;
G_rsd1 = std(G_cycle2) / std(Y_cycle2) * 100;
fprintf('Relative Standard Deviations for subsample 2:\n');
fprintf('Y_cycle: %.4f%%\n', Y_rsd1);
fprintf('C_cycle: %.4f%%\n', C_rsd1);
fprintf('I_cycle: %.4f%%\n', I_rsd1);
fprintf('G_cycle: %.4f%%\n', G_rsd1);
corr_matrix1 = corrcoef([Y_cycle2, C_cycle2, I_cycle2, G_cycle2]);
disp('Contemporaneous Output Correlations of Cyclical Components for subsample 2')
disp('-----------------------------------------------------------------------')
disp('          Y         C         I         G')
disp(corr_matrix1)
T2 = table(std_Y_cycle2, std_C_cycle2, std_I_cycle2, std_G_cycle2, Y_rsd1, C_rsd1, I_rsd1, G_rsd1, ...
          corr_matrix1(1,1), corr_matrix1(1,2), corr_matrix1(1,3), corr_matrix1(1,4), ...
          corr_matrix1(2,1), corr_matrix1(2,2), corr_matrix1(2,3), corr_matrix1(2,4), ...
          corr_matrix1(3,1), corr_matrix1(3,2), corr_matrix1(3,3), corr_matrix1(3,4), ...
          corr_matrix1(4,1), corr_matrix1(4,2), corr_matrix1(4,3), corr_matrix1(4,4), ...
          'VariableNames', {'Std_Y', 'Std_C', 'Std_I', 'Std_G', 'RSD_Y', 'RSD_C', 'RSD_I', 'RSD_G', ...
                            'Corr_Y_Y', 'Corr_Y_C', 'Corr_Y_I', 'Corr_Y_G', ...
                            'Corr_C_Y', 'Corr_C_C', 'Corr_C_I', 'Corr_C_G', ...
                            'Corr_I_Y', 'Corr_I_C', 'Corr_I_I', 'Corr_I_G', ...
                            'Corr_G_Y', 'Corr_G_C', 'Corr_G_I', 'Corr_G_G'});
disp(T2)

%% Comment: The results from subsample 2 again show that investments is the most volatile time series among the four. Similarly to subsample 1, the correlation between output, consumption and investment is positive, indicating the series move procyclical. However, government consumption now also moves procyclical with output.
 
save('my_workspace.mat')



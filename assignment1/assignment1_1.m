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
Y_rsd = std(Y_cycle) / mean(Y_cycle) * 100;
C_rsd = std(C_cycle) / mean(C_cycle) * 100;
I_rsd = std(I_cycle) / mean(I_cycle) * 100;
G_rsd = std(G_cycle) / mean(G_cycle) * 100;
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

%% Comment: The results indicate that the cyclical components of output (Y), consumption (C), investment (I), and government spending (G) have standard deviations ranging from 0.2112 to 0.2438, and relative standard deviations ranging from 1.7054% to 2.1316%. The contemporaneous output correlations of cyclical components suggest that there are high positive correlations among Y, C, I, and G, with correlation coefficients ranging from 0.9786 to 1.0000. This indicates that the cyclical fluctuations in these variables tend to move together. The relative standard deviation of investment is the highest among the four variables, at 2.1316%. This suggests that investment is the most volatile of the four components. The relative standard deviation of consumption is slightly higher than that of output, at 1.7531% and 1.7054%, respectively. This suggests that consumption is also subject to some volatility, although less so than investment.

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
Y_rsd1 = std(Y_cycle1) / mean(Y_cycle1) * 100;
C_rsd1 = std(C_cycle1) / mean(C_cycle1) * 100;
I_rsd1 = std(I_cycle1) / mean(I_cycle1) * 100;
G_rsd1 = std(G_cycle1) / mean(G_cycle1) * 100;
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

%% Comment: The subsample analysis shows that cyclical components of output, consumption, investment, and government spending are highly correlated, with output and consumption being almost perfectly correlated. The relative standard deviation of the cyclical components for each variable is around 1.4%. Compared to the results of the full sample, the subsample analysis shows a slightly lower degree of cyclical volatility.

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
Y_rsd1 = std(Y_cycle2) / mean(Y_cycle2) * 100;
C_rsd1 = std(C_cycle2) / mean(C_cycle2) * 100;
I_rsd1 = std(I_cycle2) / mean(I_cycle2) * 100;
G_rsd1 = std(G_cycle2) / mean(G_cycle2) * 100;
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

%% Comment: For subsample 2, the standard deviations of cyclical components are much lower than both the full sample and subsample 1. The relative standard deviations are also much lower for subsample 2. The contemporaneous output correlations of cyclical components for subsample 2 show higher correlation between Y and G compared to subsample 1, but lower correlation between Y and I. Overall, subsample 2 shows much lower volatility and correlation compared to the full sample and subsample 1.

save('my_workspace.mat')



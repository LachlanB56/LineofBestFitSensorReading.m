T = [0:10:100]' ; % Temperature from 0 - 100 in increments of 10 (degrees celsius)
V = [12.3 18.2 25.4 37.0 43.6 53.8 62 67.8 70.4 72.1 73.0]'; % Recorded voltage (mV)
plot(T,V);
hold on;

A = [T.^2, T, ones(numel(T), 1)]; %matrix showing each term of polynomial in actual values
b = V;
x3 = A\b;%find appropriate coefficients using Ax is approximately b
Vt = A*x3; %voltage as function of temperature with proper coefficients and y intercept

%figure one shows a polynomial curve of best fit from the raw sensor ouput
figure(1);
title("Polynomial Curve of Best Fit");
xlabel('Temperature (°C)');
ylabel('Voltage (mV)');
grid on;
plot(T,Vt);
plot(T,V);
legend('Measured Data','Quadratic best fit curve','Location','best')



T_lowrange = T(1:8);%only including valid range in temp and voltage
V_lowrange = V(1:8);

a_low = [T_lowrange, ones(numel(T_lowrange), 1)]; %a is matrix of mT + n 
b_low = V_lowrange; % b is output voltage
xr = a_low\b_low; % use ax is approximately b to solve

T_highrange = T(8:end); %same process as 0 to 70 but for 70 to 100
V_highrange = V(8:end);
a_high = [T_highrange, ones(numel(T_highrange), 1)];
b_high = V_highrange;
x_high = a_high \ b_high;

%figure 2 shows linear line of best fit for the high/low sensor readings.
figure(2)
title("Linear Lines of Best Fit")
xlabel('Temperature (°C)');
ylabel('Voltage (mV)');
grid on;
hold on
plot(T_lowrange, a_low*xr);
plot(T_highrange, a_high*x_high);
plot(T,V);
legend('Low-Range Linear Fit (0–70°C)', ...
       'High-Range Linear Fit (70–100°C)', ...
       'Measured Data', ...
       'Location','best')

clear;
clc;
clear;
close all;

%% Basic Parameters

c = 3e8;              % Speed of light (m/s)

Pt_dBm = 30;          % Transmit power (dBm)
Gt_dBi = 0;           % Transmitter antenna gain (dBi)
Gr_dBi = 0;           % Receiver antenna gain (dBi)

fc = 900e6;            % Carrier frequency (Hz)

%% Objective 1: FSPL at Different Distances

distance_km = 0.1:0.1:10;
distance_m = distance_km * 1000;

lambda = c / fc;

FSPL_dB = 20 * log10((4*pi*distance_m) / lambda);

%% Calculate Received Power

Pr_dBm = Pt_dBm + Gt_dBi + Gr_dBi - FSPL_dB;

%% Display FSPL at 1 km

d1 = 1000;

FSPL_1km = 20 * log10((4*pi*d1) / lambda);

Pr_1km = Pt_dBm + Gt_dBi + Gr_dBi - FSPL_1km;

fprintf('Carrier Frequency = %.2f MHz\n', fc/1e6);
fprintf('Wavelength = %.4f m\n', lambda);
fprintf('FSPL at 1 km = %.2f dB\n', FSPL_1km);
fprintf('Received Power at 1 km = %.2f dBm\n\n', Pr_1km);

%% Plot FSPL vs Distance

figure(1);


print('\n');
subplot(2,1,1);
plot(distance_km, FSPL_dB, 'LineWidth', 2,'color','r');

grid on;

xlabel('Distance (km)');
ylabel('Free-Space Path Loss (dB)');
title('Free-Space Path Loss vs Distance');

%% Plot Received Power vs Distance

subplot(2,1,2);

plot(distance_km, Pr_dBm, 'LineWidth', 2,'color','g');

grid on;

xlabel('Distance (km)');
ylabel('Received Power (dBm)');
title('Received Power vs Distance');
suptitle('Distance Analysis');

%% Objective 2: Effect of Carrier Frequency

frequency_MHz = [700 900 1800 2400 3500];

frequency_Hz = frequency_MHz * 1e6;

d_fixed = 1000;        % 1 km

lambda_f = c ./ frequency_Hz;

FSPL_frequency = ...
    20 * log10((4*pi*d_fixed) ./ lambda_f);

Pr_frequency = ...
    Pt_dBm + Gt_dBi + Gr_dBi - FSPL_frequency;

%% Display Frequency Results

fprintf('Frequency Analysis:\n\n');

for i = 1:length(frequency_MHz)

    fprintf('Frequency = %.0f MHz, FSPL = %.2f dB, Received Power = %.2f dBm\n', ...
        frequency_MHz(i), ...
        FSPL_frequency(i), ...
        Pr_frequency(i));

end

%% Plot FSPL vs Frequency
figure(2);
subplot(2,1,1);

plot(frequency_MHz, FSPL_frequency, 'o-', 'LineWidth', 2,'color','blue');

grid on;

xlabel('Carrier Frequency (MHz)');
ylabel('Free-Space Path Loss (dB)');
title('Free-Space Path Loss vs Carrier Frequency');

%% Plot Received Power vs Frequency

subplot(2,1,2);
suptitle(' FIGURE 2: Frequency Analysis');
plot(frequency_MHz, Pr_frequency, 'o-', 'LineWidth', 2,'color','k');

grid on;

xlabel('Carrier Frequency (MHz)');
ylabel('Received Power (dBm)');
title('Received Power vs Carrier Frequency');

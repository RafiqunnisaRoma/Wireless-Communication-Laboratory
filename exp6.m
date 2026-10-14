clc;
clear;
close all;

%% Parameters

% Reference received power
Pr_d0 = -40;          % dBm

% Reference distance
d0 = 1;               % km

% Path loss exponent
n = 3;

% Base station distances from mobile
distance = [1.5 2 3]; % km

% Base station names
BS = {'BS1', 'BS2', 'BS3'};

%% Calculate Received Signal Strength

Pr = Pr_d0 - 10*n*log10(distance/d0);

%% Display Results

fprintf('Received Signal Strength:\n\n');

for i = 1:length(distance)

    fprintf('%s: Distance = %.2f km, RSS = %.2f dBm\n', ...
        BS{i}, distance(i), Pr(i));

end

%% Select the Best Base Station

[maxRSS, index] = max(Pr);

fprintf('\nBest Serving Base Station: %s\n', BS{index});
fprintf('Maximum Received Signal Strength: %.2f dBm\n', maxRSS);

%% Plot Received Signal Strength

figure;

bar(Pr);

grid on;

xlabel('Base Station');
ylabel('Received Signal Strength (dBm)');
title('Received Signal Strength from Different Base Stations');

set(gca, 'XTickLabel', BS);

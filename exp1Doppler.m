clc;
close all;
clear; 

%%Basic parameters
c= 3e8;
fc= 900e6;
v_kmh= 60;
%Convert velocity km/h to m/s
v= v_kmh/3.6;

%%Calculate Doppler frequency 
fd_max= (v*fc)/c;

fprintf('Mobile velocity = %.2f km/h\n',v_kmh);
fprintf('Mobile velocity = %.2f m/s\n',v);
fprintf('Carrier frequency = %.2f MHz\n',fc/1e6);
fprintf('Maximum Doppler shift = %.2f Hz\n',fd_max);


%%determine maximum mobile velocity;
fd_allowed= 100;
v_max=(fd_allowed * c)/fc;
v_max_kmh= v_max * 3.6;

fprintf('Maximum Mobile velocity = %.2f km/h\n',v_max_kmh);
fprintf('Maximum Mobile velocity = %.2f m/s\n',v_max);
fprintf('Maximum allowable Doppler frequency = %.2f Hz\n',fd_allowed);

%%analyze the effect of mobile velocity
velocity_kmh= 0:10:200;
velocity_ms = velocity_kmh /3.6;
fd_velocity= (velocity_ms * fc)/c;

figure;

subplot(3,1,1);
plot(velocity_kmh,fd_velocity,'o-','color','red','LineWidth',2);
grid on;

xlabel('Mobile Velocity (Km/h)');
ylabel('Maximum Doppler Shift (Hz)');
title('Effect of Mobile Velocity per Doppler Shift');

%%analyze the effect of carrier frequency 
fc_values= [600e6 900e6 2100e6];
fd_fc= (v .* fc_values) ./c;

subplot(3,1,2);
plot(fc_values,fd_fc,'o-','color','black','LineWidth',2);
grid on;

xlabel('Carrier Frequency (MHz)');
ylabel('Maximum Doppler Shift (Hz)');
title('Effect of Carrier Frequency per Doppler Shift');


%%determin the direction of movement
theta= 0:1:360;
fd_direction= fd_max * cosd(theta);

subplot(3,1,3);
plot(theta,fd_direction,'color','green','LineWidth',2);
grid on;

xlabel('Direction of Angle (degrees)');
ylabel('Maximum Doppler Shift (Hz)');
title('Effect of Direction of Angle per Doppler Shift');
suptitle('Analysis of Doppler Shift');

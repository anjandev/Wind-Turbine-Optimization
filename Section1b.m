clear all
close all
clc

addpath './obj'

% Global constants
AIR_DENSITY = 1.205; % kg/m3 at 20 °C
AIR_VISCOUSITY = 15.11*10^-6; %kg/(m. s) AT At 20 °C

DIVISIONS = 10000;

ROTOR_RADIUS = 2; % m
WINDSPEED = 12; % m/s

MIN_ROTOR_SPEED_HZ = 20; % Hz
MAX_ROTOR_SPEED_HZ = 50; % Hz

% Equations that will be used
AREA = pi * ROTOR_RADIUS^2;

rotor_speeds_HZ = linspace(MIN_ROTOR_SPEED_HZ, MAX_ROTOR_SPEED_HZ, DIVISIONS);

Power_avail = (1/2)*WINDSPEED^3*AIR_DENSITY*AREA;

advancedRatios = zeros(1, DIVISIONS);
CpVsWindSpeed = zeros(1, DIVISIONS);
Power_ext = zeros(1, DIVISIONS);

for idx = 1:DIVISIONS
    advancedRatios(idx) = ROTOR_RADIUS * rotor_speeds_HZ(idx) / WINDSPEED;  % advanced ratios (Ω),
    CpVsWindSpeed(idx) = CpVsOmega(advancedRatios(idx));
    Power_ext(idx) = Power_avail * CpVsWindSpeed(idx);
end 

Re_d = (AIR_DENSITY * 2 * ROTOR_RADIUS * WINDSPEED)/ AIR_VISCOUSITY;


%% Plotting
subplot(1,3,1);
% TODO: IS THIS Extracted power or available power. Using extracted power
% right now
plot(rotor_speeds_HZ, Power_ext,'*')
title(['Rotor Speeds Vs Power Extracted'])
xlabel('Rotor Speeds (Hz)')
ylabel('Power Extracted (W)') % TODO: CHECK UNITS WATTS?

subplot(1,3,2);
plot(rotor_speeds_HZ, Power_avail,'*')
title(['Power Vs Rotor Speed'])
xlabel('Rotor Speed (Hz)')
ylabel('Power (W)')

subplot(1,3,3);
plot(WINDSPEED, Re_d,'*')
title(['Re_d Vs Wind Speed'])
xlabel('Wind Speed (m/s)')
ylabel('Re_d')
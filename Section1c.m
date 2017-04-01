clear all
close all
clc

addpath './obj'

% Global constants
AIR_DENSITY = 1.205; % kg/m3 at 20 °C
AIR_VISCOUSITY = 15.11*10^-6; %kg/(m. s) AT At 20 °C

DIVISIONS = 10000;

% Section 1 (c) constants
ROTOR_SPEED_HZ = 25 % Hz
WINDSPEED = 12; % m/s

MIN_ROTOR_RADIUS = 1; % m
MAX_ROTOR_RADIUS = 4; % m

% Equations that will be used
rotor_radiuses = linspace(MIN_ROTOR_RADIUS, MAX_ROTOR_RADIUS, DIVISIONS);

areas = pi * rotor_radiuses.^2;

Power_avail = (1/2)*WINDSPEED^3*AIR_DENSITY*areas;

advancedRatios = zeros(1, DIVISIONS);
CpVsWindSpeed = zeros(1, DIVISIONS);
Power_ext = zeros(1, DIVISIONS);


for idx = 1:DIVISIONS
    advancedRatios(idx) = rotor_radiuses(idx) * ROTOR_SPEED_HZ / WINDSPEED;  % advanced ratios (Ω),
    CpVsWindSpeed(idx) = CpVsOmega(advancedRatios(idx));
    Power_ext(idx) = Power_avail(idx) * CpVsWindSpeed(idx);
end 

Re_d = (AIR_DENSITY * 2 * rotor_radiuses.* WINDSPEED)/ AIR_VISCOUSITY;

%% Plotting
subplot(1,3,1);
plot(rotor_radiuses, Power_avail,'*')
title(['Power Available Vs Rotor Radiuses'])
xlabel('Rotor Radiuses (m)')
ylabel('Power Available (W)')

subplot(1,3,2);
plot(rotor_radiuses, Power_ext,'*')
title(['Power Extracted Vs Rotor Radiuses'])
xlabel('Rotor Radiuses (m)')
ylabel('Power Extracted (W)')

subplot(1,3,3);
plot(rotor_radiuses, Re_d,'*')
title(['Re_d Vs Rotor Radiuses'])
xlabel('Rotor Radiuses (m)')
ylabel('Re_d') 
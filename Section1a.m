clear all
close all
clc

addpath './obj'

%% Global constants

AIR_DENSITY = 1.205; % kg/m3 at 20 °C
AIR_VISCOUSITY = 15.11*10^-6; %kg/(m. s) AT At 20 °C

DIVISIONS = 10000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Section 1
%% Section 1 (a) constants
ROTOR_RADIUS_1a = 2; % m
ROTOR_SPEED_HZ_1a = 25; % Hz

MIN_WINDSPEED_1a = 6; % m/s
MAX_WINDSPEED_1a = 16; % m/s

% Equations that will be used
AREA_1a = pi * ROTOR_RADIUS_1a^2; %m^2

windspeeds_1a = linspace(MIN_WINDSPEED_1a, MAX_WINDSPEED_1a, DIVISIONS); % m/s

Power_avail_1a = (1/2)*windspeeds_1a.^3*AIR_DENSITY*AREA_1a; % W

advancedRatios = zeros(1, DIVISIONS);
CpVsWindSpeed = zeros(1, DIVISIONS);
Power_ext = zeros(1, DIVISIONS);

for idx = 1:DIVISIONS
    advancedRatios_1a = ROTOR_RADIUS_1a * ROTOR_SPEED_HZ_1a / windspeeds_1a(idx);  % advanced ratios (Ω),
    CpVsWindSpeed(idx) = CpVsOmega(advancedRatios_1a);
    Power_ext(idx) = Power_avail_1a(idx) * CpVsOmega(advancedRatios_1a); % W
end 

Re_d = (AIR_DENSITY * 2 * ROTOR_RADIUS_1a * windspeeds_1a)/ AIR_VISCOUSITY;

subplot(1,4,1);
plot(windspeeds_1a, Power_avail_1a,'*')
title(['Power Available Vs Wind Speed'])
xlabel('Wind Speed (m/s)')
ylabel('Power Available (W)') 

subplot(1,4,2);
plot(windspeeds_1a, Power_ext,'*')
title(['Power Extracted Vs Wind Speed'])
xlabel('Wind Speed (m/s)')
ylabel('Power Extracted (W)')

subplot(1,4,3);
plot(windspeeds_1a, CpVsWindSpeed,'*')
title(['Power Coefficent Vs Wind Speed'])
xlabel('Wind Speed (m/s)')
ylabel('Power Coefficent (C_p)')

subplot(1,4,4);
plot(windspeeds_1a, Re_d,'*')
title(['Re_d Vs Wind Speed'])
xlabel('Wind Speed (m/s)')
ylabel('Re_d')
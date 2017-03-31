clear all
close all
clc

addpath './obj'

% Global constants
AIR_DENSITY = 1.205; % kg/m3 at 20 °C
AIR_VISCOUSITY = 15.11*10^-6; %kg/(m. s) AT At 20 °C

DIVISIONS = 10000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Section 1
% Section 1 (a) constants
ROTOR_RADIUS_1a = 2; % m
ROTOR_SPEED_HZ_1a = 25; % Hz

MIN_WINDSPEED_1a = 6;
MAX_WINDSPEED_1a = 16;

% Equations that will be used
AREA_1a = pi * ROTOR_RADIUS_1a^2;

windspeeds_1a = linspace(MIN_WINDSPEED_1a, MAX_WINDSPEED_1a, DIVISIONS);

Power_avail_1a = (1/2)*windspeeds_1a.^3*AIR_DENSITY*AREA_1a;

for idx = 1:DIVISIONS
    advancedRatios_1a(idx) = ROTOR_RADIUS_1a * ROTOR_SPEED_HZ_1a / windspeeds_1a(idx);  % advanced ratios (Ω),
end 

Re_d = (AIR_DENSITY * 2 * ROTOR_RADIUS_1a * windspeeds_1a)/ AIR_VISCOUSITY;

% DO SOME CODES FOR PLOT CUZ IDK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Section 1 (b) constants
ROTOR_RADIUS_1b = 2; % m
WINDSPEED_1b = 12; % m/s

MIN_ROTOR_SPEED_HZ_1b = 20; % Hz
MAX_ROTOR_SPEED_HZ_1b = 50; % Hz

% Equations that will be used
AREA_1b = pi * ROTOR_RADIUS_1b^2;

rotor_speed_1b = linspace(MIN_ROTOR_SPEED_HZ_1b, MAX_ROTOR_SPEED_HZ_1b, DIVISIONS);

Power_avail_1b = (1/2)*WINDSPEED_1b^3*AIR_DENSITY*AREA_1b;

for idx = 1:DIVISIONS
    advancedRatios_1b(idx) = ROTOR_RADIUS_1b * rotor_speed_1b(idx) / WINDSPEED_1b;  % advanced ratios (Ω),
end 

Re_d = (AIR_DENSITY * 2 * ROTOR_RADIUS_1b * WINDSPEED_1b)/ AIR_VISCOUSITY;

% DO SOME CODES FOR PLOT CUZ IDK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Section 1 (c) constants
ROTOR_SPEED_HZ_1c = 25 % Hz
WINDSPEED_1c = 12; % m/s

MIN_ROTOR_RADIUS_1c = 1; % m
MAX_ROTOR_RADIUS_1c = 4; % m

% Equations that will be used
rotor_radius_1c = linspace(MIN_ROTOR_RADIUS_1c, MAX_ROTOR_RADIUS_1c, DIVISIONS);

AREA_1c = pi * rotor_radius_1c.^2;

Power_avail_1b = (1/2)*WINDSPEED_1c^3*AIR_DENSITY*AREA_1c;

for idx = 1:DIVISIONS
    advancedRatios_1c(idx) = ROTOR_RADIUS_1b * rotor_speed_1b(idx) / WINDSPEED_1b;  % advanced ratios (Ω),
end 

Re_d = (AIR_DENSITY * 2 * rotor_radius_1c * WINDSPEED_1c)/ AIR_VISCOUSITY;

% DO SOME CODES FOR PLOT CUZ IDK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Section 2

WINDSPEED_2 = 12; % m/s

MIN_ROTOR_RADIUS_2 = 1; % m
MAX_ROTOR_RADIUS_2 = 8; % m

MIN_ROTOR_SPEED_HZ_2 = 20; % Hz
MAX_ROTOR_SPEED_HZ_2 = 35; % Hz

rotor_radius_2 = linspace(MIN_ROTOR_RADIUS_2, MAX_ROTOR_RADIUS_2, DIVISIONS);
rotor_speed_2 = linspace(MIN_ROTOR_SPEED_HZ_2, MAX_ROTOR_SPEED_HZ_2, DIVISIONS);

% need to find rotor diameter and the speed thatr maximizes extracted power
% This is the end of the code



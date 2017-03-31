clear all
close all
clc

addpath './obj'


ROTOR_RADIUS = 2; % m
ROTOR_SPEED_HZ = 25; % Hz
OMEGA = ROTOR_SPEED_HZ * 2 * pi; % ROTOR_SPEED_HZ in rad/s

MIN_WINDSPEED = 6;
MAX_WINDSPEED = 16;
AIR_DENSITY = 1.205; % kg/m3 at 20 °C
AIR_VISCOUSITY = 15.11*10^-6; %kg/(m. s) AT At 20 °C


DIVISIONS = 10000;


AREA = pi * (1/2) * ROTOR_RADIUS^2;

windspeeds = linspace(MIN_WINDSPEED, MAX_WINDSPEED, DIVISIONS);

Power_avail = (1/2)*windspeeds.^3*AIR_DENSITY*AREA;

advancedRatios = ROTOR_RADIUS * OMEGA / windspeeds;  % advanced ratios (Ω),

Re_d = (AIR_DENSITY * 2 * ROTOR_RADIUS * windspeeds)/ AIR_VISCOUSITY;

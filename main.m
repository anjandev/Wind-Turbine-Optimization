clear all
close all
clc


ROTOR_RADIUS = 2; % m
ROTOR_SPEED = 25; % Hz


MIN_WINDSPEED = 6;
MAX_WINDSPEED = 16;
AIR_DENSITY = 1.225; % kg/m3

DIVISIONS = 10000;

windspeeds = linspace(MIN_WINDSPEED, MAX_WINDSPEED, DIVISIONS);


for idx = 1:DIVISIONS
    Power_avail(idx) = (1/2)*windspeeds(idx)^3*pi*AIR_DENSITY*ROTOR_RADIUS^2/4
end

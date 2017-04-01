clear all
close all
clc

addpath './obj'

DIVISIONS = 10000;

WINDSPEED = 12; % m/s

MIN_ROTOR_RADIUS = 1; % m
MAX_ROTOR_RADIUS = 8; % m

MIN_ROTOR_SPEED_HZ = 20; % Hz
MAX_ROTOR_SPEED_HZ = 35; % Hz

rotor_radiuses = linspace(MIN_ROTOR_RADIUS, MAX_ROTOR_RADIUS, DIVISIONS);
rotor_speeds = linspace(MIN_ROTOR_SPEED_HZ, MAX_ROTOR_SPEED_HZ, DIVISIONS);

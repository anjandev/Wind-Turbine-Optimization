clear all
close all
clc

addpath './obj'

DIVISIONS = 10;

MAX_DOMAIN_OMEGA = 9.55;
MIN_DOMAIN_OMEGA = 2;

WINDSPEED = 12; % m/s

MIN_ROTOR_RADIUS = 1; % m
MAX_ROTOR_RADIUS = 8; % m

MIN_ROTOR_SPEED_HZ = 20; % Hz
MAX_ROTOR_SPEED_HZ = 35; % Hz

rotor_radiuses = linspace(MIN_ROTOR_RADIUS, MAX_ROTOR_RADIUS, DIVISIONS);
rotor_speeds = linspace(MIN_ROTOR_SPEED_HZ, MAX_ROTOR_SPEED_HZ, DIVISIONS);

n = 1;

CpMax = 0;
rotorRWithMaxCp = 0;
rotorSpeedWithMaxCp = 0;
advancedRatioWithMaxCp = 0;

for rotorRadiusIdx = 1:DIVISIONS
    for rotorSpeedIdx = 1:DIVISIONS
        advancedRatio = rotor_radiuses(rotorRadiusIdx) * rotor_speeds(rotorSpeedIdx) / WINDSPEED;
        if advancedRatio >= MIN_DOMAIN_OMEGA && advancedRatio <= MAX_DOMAIN_OMEGA
            if CpVsOmega(advancedRatio) > CpMax
                CpMax = CpVsOmega(advancedRatio);
                rotorRWithMaxCp = rotor_radiuses(rotorRadiusIdx);
                rotorSpeedWithMaxCp = rotor_speeds(rotorSpeedIdx);
                advancedRatioWithMaxCp = advancedRatio;
            end
        end
    end
 end

rotorDiameter = rotorRWithMaxCp*2;
 
X = ['Rotor diameter that maximizes the extracted power is ',num2str(rotorDiameter),'m.'];
Y = ['Rotor speed that maximizes the extracted power is ',num2str(rotorSpeedWithMaxCp),'Hz.'];
Z = ['The advanced ratio that maximizes extracted power is ',num2str(advancedRatioWithMaxCp)];

disp(X);
disp(Y);
disp(Z);
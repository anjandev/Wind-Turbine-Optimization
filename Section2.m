clear all
close all
clc

addpath './obj'

DIVISIONS = 1000;

MAX_DOMAIN_OMEGA = 9.55;
MIN_DOMAIN_OMEGA = 2;

WINDSPEED = 12; % m/s

MIN_ROTOR_RADIUS = 1; % m
MAX_ROTOR_RADIUS = 8; % m

MIN_ROTOR_SPEED_HZ = 20; % Hz
MAX_ROTOR_SPEED_HZ = 35; % Hz

rotor_radiuses = linspace(MIN_ROTOR_RADIUS, MAX_ROTOR_RADIUS, DIVISIONS);
rotor_speeds = linspace(MIN_ROTOR_SPEED_HZ, MAX_ROTOR_SPEED_HZ, DIVISIONS);

%points from Cp graph
CpData = [2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5;
     .025, .19, .30, .37, .4, .425, .437, .45, .45, .445, .435, .42, .385, .35, .28];

%%curve fit polynomial to data above^
coefs = polyfit(CpData(1,:), CpData(2,:), 6);

n = 1;

CpMax = 0;
rotorRWithMaxCp = 0;
rotorSpeedWithMaxCp = 0;
advancedRatioWithMaxCp = 0;

for rotorRadiusIdx = 1:DIVISIONS
    for rotorSpeedIdx = 1:DIVISIONS
        advancedRatio = rotor_radiuses(rotorRadiusIdx) * rotor_speeds(rotorSpeedIdx) / WINDSPEED;
        cpCurrent = polyval(coefs, advancedRatio);
        if advancedRatio >= MIN_DOMAIN_OMEGA && advancedRatio <= MAX_DOMAIN_OMEGA
            if cpCurrent > CpMax
                CpMax = polyval(coefs, advancedRatio);
                rotorRWithMaxCp = rotor_radiuses(rotorRadiusIdx);
                rotorSpeedWithMaxCp = rotor_speeds(rotorSpeedIdx);
                advancedRatioWithMaxCp = advancedRatio;
            end
        end
    end
 end

rotorDiameter = rotorRWithMaxCp*2;
 
X = ['Rotor diameter that maximizes the extracted power is ',num2str(rotorDiameter),' m.'];
Y = ['Rotor speed that maximizes the extracted power is ',num2str(rotorSpeedWithMaxCp),' Hz.'];
Z = ['The advanced ratio that maximizes extracted power is ',num2str(advancedRatioWithMaxCp)];

disp(X);
disp(Y);
disp(Z);
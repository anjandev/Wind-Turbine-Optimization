function [Cp] = CpVsOmega(Omega)
    % Piece wise function of Cp vs advanced ratios (Ω),
    if  2 <= Omega & Omega < 3.25
        Cp = sinMaker(1.725, 0.3925, -2.47, 1.85, Omega);
    elseif 3.25 <= Omega  & Omega < 3.85
        Cp = sinMaker(0.44, 0.77, -1.676, -0.0775, Omega);
    elseif 3.85 <= Omega & Omega < 4.3
        Cp = sinMaker(0.09, 1.7, 0.2, 0.3, Omega);
    elseif 4.3 <= Omega & Omega < 6
        Cp = sinMaker(0.2, 0.4, -1, 0.253, Omega);
    elseif 6 <= Omega & Omega < 7
        Cp = 0.448;        
    elseif 7 <= Omega & Omega < 8.5
        Cp = sinMaker(0.2, 0.4, -1, 0.253, Omega);
    elseif 8.5 <= Omega & Omega <= 9.55
        Cp = sinMaker(0.06, 1.7, 0.2, 0.333, Omega);
    end
end


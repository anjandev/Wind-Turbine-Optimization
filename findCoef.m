arr_adv_ratio = [2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5];
arr_cp = [0.12, 0.2, 0.3, 0.36, 0.4, 0.425, 0.44, 0.45, 0.455, 0.45, 0.444, 0.42, 0.385, 0.35, 0.295];

%Using the polyfit function to find the coefficients for the polynomial
%curve of adv_ratio vs. Cp

polyfit(arr_adv_ratio, arr_cp, 3)


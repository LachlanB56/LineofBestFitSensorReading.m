# TempVoltagereading.m
Takes raw sensor voltage output and creates a linear and polynomial line of best fit to find relation to temperature using matrix properties in matlab.
- Using Ax = b
- Where A is the Temperature in polynomal and linear form, and b is the output voltage, x is column vector of coefficients to the polynomial and linear functions.
- solved using x = A\b;
- Therefore plotting A*x provides line of best fit. 

Check TempVoltage.m for the matlab code. 

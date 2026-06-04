# Temperature Sensor Curve Fitting

A MATLAB script that fits curves to recorded temperature-versus-voltage data from a sensor, using least-squares regression. It produces two figures: a single quadratic curve of best fit across the full measurement range, and a piecewise linear fit that models the sensor's two distinct behavioral regions.

This was built as a practice project in applying linear algebra (least-squares solving) to real measured data and visualizing the results.

## Background

The sensor outputs a voltage that rises with temperature, but the response is not linear across the whole range. From roughly 0–70 °C the output increases steadily, then it begins to flatten (saturate) between 70–100 °C. A single straight line fits neither region well, which motivates two approaches:

1. **A quadratic (second-order polynomial) fit** across the entire range, which curves to follow the data.
2. **Two separate linear fits** — one for the well-behaved low range and one for the saturating high range — which together describe the data more faithfully than one line.

## What the script does

1. Defines the measured data: temperature `T` (0–100 °C in 10 °C steps) and the corresponding recorded voltage `V` (mV).
2. **Quadratic fit:** builds the design matrix `A = [T², T, 1]` and solves the least-squares system `A\b` for the polynomial coefficients, then evaluates the fitted curve.
3. **Figure 1** plots the measured data against the quadratic best-fit curve.
4. **Piecewise linear fit:** splits the data into a low range (0–70 °C) and a high range (70–100 °C), and solves a least-squares linear fit (`mT + n`) for each region.
5. **Figure 2** plots both linear fits alongside the measured data.

## The method

Each fit is solved with MATLAB's backslash operator, which returns the least-squares solution to an overdetermined system `Ax ≈ b`:

- For the **quadratic** fit, each row of the design matrix is `[T² T 1]`, so the solution gives the coefficients of `aT² + bT + c`.
- For each **linear** fit, each row is `[T 1]`, giving the slope and intercept of `mT + n`.

This is a clean demonstration of using the normal-equations / least-squares approach rather than a built-in fitting function.

## Output

| Figure | Contents |
|--------|----------|
| **Figure 1** | Measured data vs. quadratic curve of best fit |
<img width="705" height="461" alt="Screenshot 2026-06-04 111050" src="https://github.com/user-attachments/assets/4f147c15-06a0-463c-a437-f0187c998c8e" />

| **Figure 2** | Low-range linear fit (0–70 °C), high-range linear fit (70–100 °C), and measured data |
<img width="669" height="432" alt="Screenshot 2026-06-04 111059" src="https://github.com/user-attachments/assets/500fe0c6-c2c2-4bbf-b292-6bd49a79c4fb" />


Both figures are labeled with axis titles, a grid, and a legend.

## Data

| Temperature (°C) | Voltage (mV) |
|------------------|--------------|
| 0   | 12.3 |
| 10  | 18.2 |
| 20  | 25.4 |
| 30  | 37.0 |
| 40  | 43.6 |
| 50  | 53.8 |
| 60  | 62.0 |
| 70  | 67.8 |
| 80  | 70.4 |
| 90  | 72.1 |
| 100 | 73.0 |

The flattening of the voltage above 70 °C is what motivates the two-region linear model.


## What I learned

- Setting up and solving least-squares problems with the backslash operator
- Building design matrices for polynomial and linear models
- Segmenting data to model different physical regimes (linear region vs. saturation)
- Plotting and annotating multiple data series in MATLAB

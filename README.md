# ThieleTiles

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://tp2750.github.io/ThieleTiles.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://tp2750.github.io/ThieleTiles.jl/dev/)
[![Build Status](https://github.com/tp2750/ThieleTiles.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tp2750/ThieleTiles.jl/actions/workflows/CI.yml?query=branch%3Amain)

This package is inspired by this paper by Steffen L. Lauritzen: http://web.math.ku.dk/~lauritzen/papers/ThieleOgGulvfliser.pdf (in Danish) abut the floow tiles designed by Thorvald Nicolai Thiele (1838-1910).

Here's an example of what it can do:

```
using Plots
using ThieleTiles

plot_gaussian_primes(15); invert_colors = true)

```

![Gaussian Primes, invert_colors](docs/src/imgs/gauss_primes_15_inv.png)

See more the the docs.

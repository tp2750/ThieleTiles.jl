module ThieleTiles

using Plots
using Primes

include("gauss_primes.jl")
export plot_gaussian_primes, is_gaussian_prime

include("quadratic_residues.jl")
export compute_quadratic_residues, plot_quadratic_residues

end

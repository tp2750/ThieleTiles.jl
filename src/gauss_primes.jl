using Plots
using Primes

function gaussian_prime(x::Int, y::Int)
    if x == 0
        return (abs(y) % 4) == 3 && isprime(abs(y))
    elseif y == 0
        return (abs(x) % 4) == 3 && isprime(abs(x))
    else
        return isprime(x^2 + y^2)
    end
end

function get_gaussian_primes(x_range, y_range)
    z = zeros(length(y_range), length(x_range))
    j = 0
    i = 0
    for x in x_range
        j = j+1
        i = 0
        for y in y_range
            i = i+1
            @debug "($i, $j) = $(gaussian_prime(x,y))"
            z[i,j] = Int(gaussian_prime(x,y))
        end
    end
    z
end

function plot_gaussian_primes(x_range, y_range; invert_colors=false)
    z = get_gaussian_primes(x_range, y_range)
    if invert_colors
        z = 1 .- z
    end
    heatmap(x_range, y_range, z; aspect_ratio = :equal)
end

function plot_gaussian_primes(range; invert_colors=false)
    plot_gaussian_primes(range, range; invert_colors=invert_colors)
end

function plot_gaussian_primes(x::Int; invert_colors=false)
    plot_gaussian_primes(-x:x; invert_colors = invert_colors)
end

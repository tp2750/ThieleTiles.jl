using AbstractAlgebra
using GaussianIntegers

function compute_quadratic_residues(c, x_range, y_range)
    c_r = real(c)
    c_i = imag(c)
    G = GaussianIntegerRing()
    R = residue_ring(G, G(c_r,c_i))
    z = zeros(length(y_range), length(x_range))
    for x in -c_r:c_r
        for y in -c_i:c_i
            q = G(x,y)^2
            for xx in x_range
                j = j+1
                i = 0
                for yy in y_range
                    i = i+1
                    if R(G(xx,yy)) == R(q)
                        z[i,j] = true
                    end
                end
            end
        end
    end
    z
end

## If the prime is an integer, we can use Euler's criterion https://en.wikipedia.org/wiki/Euler%27s_criterion:
## a = x^2 mod p iff a^(p-1)/2 == 1 mod p

function is_quadratic_residue(a, p) # for p \in Z, a \in Z[i]
    @assert p % 2 == 1
    G = GaussianIntegerRing()
    R = residue_ring(G, G(p,0))
    A = G(real(a), imag(a))
    R(G(1,0)) == R(A^(div(p-1,2)))
end


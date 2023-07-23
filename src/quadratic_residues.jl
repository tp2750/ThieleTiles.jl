function compute_quadratic_residues(p::Int; repeat=1)
    ## For integer p, just compute all squares and mark them
    @assert isprime(p)
    d = (p*repeat+1)
    z = zeros(d,d)
    i = j = 0
    for x in -p:p
        for y in -p:p
            q = (x + y*im)^2
            qr = real(q) + p^3 ## assert non negative
            qi = imag(q) + p^3
            @debug "q=$q, qi=$qi, qr=$qr"
            z[qi%p+1,qr%p+1] = 1
        end
    end
    # z[1,1] = .5
    if repeat > 1
        for x in 0:repeat-1
            for y in 0:repeat-1
                for j in 1:p
                    for i in 1:p
                        z[i + x*p,j + y*p] = z[i,j]
                    end
                end
            end
        end
    end
    z[:,d] = z[:,1]
    z[d,:] = z[1,:]
    z[d,d] = z[1,1]
    z
end

function plot_quadratic_residues(p::Int; invert_colors=false, repeat=1, compact_title=false, simple=false)
    ## Simple: no decoration, only modulo and repeats
    ## full: decorations, invert
    z = compute_quadratic_residues(p; repeat=repeat)
    inv_text=""
    if invert_colors
        z = 1 .- z
        inv_text = " (inverted colors)"
    end
    x1 = size(z)[1]-1
    y1 = size(z)[2]-1
    title = "Quadratic residues modulo $p$inv_text"
    if compact_title
        title = "$p"
        invert_colors && (title = title * " (inv)")
    end
    if repeat > 1
        title = title * " rep: $repeat"
    end
    my_controls = (simple ? (showaxis=false, legend=:none, title=title, grid=false) : ())
    heatmap(0:x1, 0:y1 , z; aspect_ratio=:equal, title=title, my_controls...)
end

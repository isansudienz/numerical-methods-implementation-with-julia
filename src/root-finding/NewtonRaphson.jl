using ForwardDiff
using Plots

function newtonraphson(xi, es)
    iterations = []
    xi_values = []
    ea_values = []
    
    for i = 1:100
        f(xi) = xi^2-7*xi+6
        y = f(xi)
        g = ForwardDiff.derivative(f, xi)
        xii = xi - (y/g)
        ea = abs((xii - xi)/xii)
        println((i,xi,xii,ea))
        
        push!(iterations, i)
        push!(xi_values, xii)
        push!(ea_values, ea)
        
        if ea < es
            break
        end
        xi = xii
    end
    
    
    # plot
    plot(plot(iterations, xi_values, marker=:circle, linewidth=2, title="Konvergensi Newton-Raphson", xlabel="Iterasi", ylabel="xi", label="Root approximation", legend=:right), plot(iterations, ea_values, marker=:square, linewidth=2, color=:red, title="Error Relatif", xlabel="Iterasi", ylabel="ea", label="Relative error", legend=:topright, yscale=:log10), layout=(2, 1), size=(600, 800))
    
end

newtonraphson(2.5, 0.001)
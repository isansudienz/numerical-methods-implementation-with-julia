using Plots

function bisection(xl, xu, es)
    f(x) = (x^2) - (7 * x) + 2
    iterations = []
    xm_values = []
    ea_values = []
    
    for i = 1:9
        fxl = f(xl)
        fxu = f(xu)
        println(fxl)
        println(fxu)
        
        if fxl * fxu > 0
            break
        end
        
        xm = (xl + xu) / 2
        fxm = (xm^2) - (7 * xm) + 2

        if fxl * fxm < 0
            xu = xm
        else 
            xl = xm
        end
        println("xm :", xm)
        xm1 = (xl + xu) / 2
        ea = abs((xm1 - xm) / xm1) 
        println((i, xl, xu, xm1, ea))
        
        push!(iterations, i)
        push!(xm_values, xm1)
        push!(ea_values, ea)
        
        if ea < es
            break
        end
    end
    
    
    # plot
    plot(plot(iterations, xm_values, marker=:circle, linewidth=2, title="Konvergensi Metode Bisection", xlabel="Iterasi", ylabel="xm", label="Root approximation", legend=:right), plot(iterations, ea_values, marker=:square, linewidth=2, color=:red, title="Error Relatif", xlabel="Iterasi", ylabel="ea (%)", label="Relative error", legend=:topright), layout=(2, 1), size=(600, 800))
end

bisection(0.0, 1.0, 0.01)
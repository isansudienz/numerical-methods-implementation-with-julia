using Plots

f(x, y) = exp(x) - y

function runge_kutta(y0, x0, h)
    N = Int(round((1.0 - x0) / h))
    x_values = Float64[]
    errors = Float64[]
    println("i\t x\t\t y_numeric\t y_exact\t error")
    for i = 1:N
        k1 = f(x0, y0)
        k2 = f(x0 + h, y0 + h * k1)
        y1 = y0 + (0.5 * k1 + 0.5 * k2) * h
        x1 = x0 + h
        y_exact = 0.5 * (exp(x1) - exp(-x1)) 
        ea = abs(y_exact - y1)
        println("$i\t ", round(x1, digits=2), "\t\t ", round(y1, digits=5), "\t ", round(y_exact, digits=5), "\t ", round(ea, digits=5))
        push!(x_values, x1)
        push!(errors, ea)
        x0 = x1
        y0 = y1
    end
    return x_values, errors
end
h=0.2
x_vals, error_vals = runge_kutta(0.0, 0.0, h)
y_exact1 = 0.5 * (exp(1.0) - exp(-1.0))
println("Nilai y(1) adalah ", y_exact1)
plot(x_vals, error_vals,
    linewidth=2,
    title="Kurva Error Absolut (h=$h)",
    xlabel="x",
    ylabel="Error Absolut",
    label="Error",
    legend=:topleft)

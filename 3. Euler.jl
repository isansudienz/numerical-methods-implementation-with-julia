using Plots

x0, y0, n = 0, 1, 10
h = (1-0)/n  #h = lebar x

x_values = [x0]
y_numeric = [y0]
y_analytic = [1.3*exp(-x0) + 3.7*exp(-2*x0)]
ea_values = [0.0]

for i = 1:n
    #metode euler
    fxy = 1.3*(exp(-x0))- 2*y0 #fungsi f(x,y)
    y1 = y0 + h*fxy
    x1 = x0 + h
    global x0 = x1
    global y0 = y1

    #solusi analitik
    y = 1.3*exp(-x1) + 3.7*exp(-2*x1)

    #eror
    ea = abs((y - y1)/y)
    println("i = $i: x1 = $x1, y2 = $y1, y = $y, Eror = $ea ")
    
    push!(x_values, x1)
    push!(y_numeric, y1)
    push!(y_analytic, y)
    push!(ea_values, ea)
end
# plot
plot(plot(x_values, y_numeric, marker=:circle, linewidth=2, title="Solusi Numerik dengan Metode Euler", xlabel="x", ylabel="y", label="Numerical Solution", legend=:right), plot(x_values, y_analytic, marker=:star, linewidth=2, color=:green, title="Solusi Analitik", xlabel="x", ylabel="y", label="Analytic Solution", legend=:topright), layout=(2, 1), size=(600, 800))


using Plots

function runge_kutta(y0, x0, h)
    N = Int((1 - x0) / h) # Jumlah langkah dari x0 sampai 1
    x_values = Float64[x0] # Array untuk menyimpan nilai x
    y_numeric = Float64[y0] # Array untuk menyimpan y numerik
    y_exact = Float64[1.3 * exp(-x0) + 3.7 * exp(-2 * x0)] # Array untuk y eksak
    ea_values = Float64[0.0] # Array untuk kesalahan absolut relatif (ea)

    for i = 1:N
        k1 = 1.3 * exp(-x0) - 2 * y0
        a = x0 + h/2
        b = y0 + (h/2) * k1
        k2 = 1.3 * exp(-a) - 2 * b
        c = x0 + h/2
        d = y0 + (h/2) * k2
        k3 = 1.3 * exp(-c) - 2 * d
        e = x0 + h
        f = y0 + h * k3
        k4 = 1.3 * exp(-e) - 2 * f
        y1 = y0 + (h/6) * (k1 + 2*k2 + 2*k3 + k4)
        x1 = x0 + h
        y = 1.3 * exp(-x1) + 3.7 * exp(-2 * x1)
        ea = abs((y - y1) / y)
        println("($i, $x1, $y1, $y, $ea)")

        # Simpan hasil ke array
        push!(x_values, x1)
        push!(y_numeric, y1)
        push!(y_exact, y)
        push!(ea_values, ea)

        # Perbarui x0 dan y0 untuk iterasi berikutnya
        x0 = x1
        y0 = y1
    end

    # Plot 1: y numerik vs y eksak
    p1 = plot(x_values, y_numeric, label="y numerik (RK4)", color=:blue, 
              linewidth=2, marker=:circle, markersize=2,
              title="Runge-Kutta Orde 4: Solusi Numerik vs Eksak")
    plot!(p1, x_values, y_exact, label="y eksak", color=:red, 
          linestyle=:dash, linewidth=2, marker=:square, markersize=2)
    xlabel!(p1, "x")
    ylabel!(p1, "y")
    
    # Tambahkan grid
    plot!(p1, grid=true, gridstyle=:dot, gridalpha=0.3)

    # Plot 2: Kesalahan absolut relatif (skala log)
    p2 = plot(x_values[2:end], ea_values[2:end], label="Kesalahan Relatif", 
              color=:green, linewidth=2, marker=:diamond, markersize=3,
              title="Kesalahan Absolut Relatif (RK4)", yscale=:log10)
    xlabel!(p2, "x")
    ylabel!(p2, "ea (log scale)")
    plot!(p2, grid=true, gridstyle=:dot, gridalpha=0.3)
    
    # Plot 3: Perbandingan error (linear scale)
    p3 = plot(x_values[2:end], ea_values[2:end], label="Error", 
              color=:orange, linewidth=2, marker=:circle, markersize=3,
              title="Error Relatif (Skala Linear)", fill=(0, 0.2))
    xlabel!(p3, "x")
    ylabel!(p3, "ea")
    plot!(p3, grid=true, gridstyle=:dot, gridalpha=0.3)

    # Gabungkan plot
    final_plot = plot(p1, p2, p3, layout=(3, 1), size=(800, 1000))
    savefig("runge_kutta_4th_order_complete.png")
    display(final_plot)
    
    return final_plot
end

runge_kutta(5, 0, 0.01)
a = 0
b = 1
n = 100
h = (b - a) / n
fa = 3 * exp(a) + exp(2 * a)
fb = 3 * exp(b) + exp(2 * b)
fc_sum = 0.0
for i = 1:n-1
    c = a + i * h
    fc = 3 * exp(c) + exp(2 * c)
    global fc_sum += fc
end
I = (h / 2) * (fa + 2 * fc_sum + fb)
I_exact = 3*exp(1) + 0.5*exp(2) - 3.5
ea = abs((I_exact - I) / I_exact)

println("I (Trapesium) = ", I)
println("I_exact       = ", I_exact)
println("ea  = ", ea)
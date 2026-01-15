using ForwardDiff
xi = 0.5
f(xi) = 2xi^2 - 4*xi + 1

for i=1:100
    g = ForwardDiff.derivative(f, xi)
    h = ForwardDiff.derivative(x -> ForwardDiff.derivative(f, x), xi)
    xii = xi - g/h
    println((i, xi, xii))
    if g==0
        break
    end
    xi = xii
end
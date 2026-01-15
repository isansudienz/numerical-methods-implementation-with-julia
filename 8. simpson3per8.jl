function Simpson3_8Rule(a, b, n)
    h = (b - a) / n
    fa = 2*a + 1
    fb = 2*b + 1
    fc_sum = 0
    fc_sum1 = 0
    fc_sum2 = 0
    for  i=1:n-1
        c = a + i * h
        fc = 2 * c + 1
            if mod(i,3) == 2
            global fc_sum1 += fc
            fc = 2 * c + 1
            elseif mod(i,3) == 1
            global fc_sum += fc
            else
            global fc_sum2 += fc
        end
    end 
    I=(3*h)/8 * ( fa + 3 * fc_sum + 3 * fc_sum1 + 2 * fc_sum2 + fb )
    println("I = ", I)    
end
# 3 titik 2 segmen minimal
# n : segmen (harus kelipatan 3) 
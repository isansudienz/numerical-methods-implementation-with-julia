function Simpson1_3Rule(a, b, n)
        h = (b - a) / n
        fa = 4 * a^5 + 2 * a 
        fb = 4 * b^5 + 2 * b
        fc_sum = 0
        fc_sum1 = 0
        for  i=1:n-1
            c = a + i * h
            fc = 4 * c^5 + 2 * c
            if mod(i,2) == 0
                global fc_sum += fc
            else
                global fc_sum1 += fc
            end
        end
        I_exact = 1.67
        ea = abs((I_exact - I) / I_exact)
        I = (b-a)/(3*n) * (fa + 4 * fc_sum1 + 2 * fc_sum + fb)
        println("I = ", I, " ea = ", ea)
end
Simpson1_3Rule(0, 1, 8)
# 3 titik 2 segmen minimal
# n : segmen (harus genap) 

#numerical-methods
## 📁 Struktur Project
```
src/
├── root-finding/          # Metode pencarian akar persamaan
│   ├── Bisection.jl
│   ├── newtonraphson.jl
│   └── Euler.jl
├── numerical-methods/     # Metode numerik Runge-Kutta
│   ├── rungekutte2order.jl
│   └── rungekutta4order.jl
├── integration/           # Metode integrasi numerik
│   ├── TrapezoidIntegral.jl
│   ├── Simpson.jl
│   └── simpson3per8.jl
└── optimization/          # Metode optimisasi
    └── Optimization.jl
```
## 📖 Metode yang Diimplementasikan

### Root Finding Methods
- **Bisection Method**: Metode pencarian akar dengan membagi interval menjadi dua bagian secara berulang
- **Newton-Raphson Method**: Metode iteratif untuk mencari akar menggunakan turunan fungsi
- **Euler Method**: Metode numerik untuk menyelesaikan persamaan diferensial biasa

### Numerical Integration
- **Trapezoidal Rule**: Metode integrasi menggunakan pendekatan trapesium
- **Simpson's 1/3 Rule**: Metode integrasi menggunakan parabola
- **Simpson's 3/8 Rule**: Varian Simpson dengan interval yang lebih kecil

### Runge-Kutta Methods
- **2nd Order Runge-Kutta**: Metode RK dengan akurasi orde 2
- **4th Order Runge-Kutta**: Metode RK klasik dengan akurasi tinggi

### Optimization
- **Optimization Methods**: Metode untuk mencari nilai optimum fungsi

## 💡 Contoh Penggunaan

### Bisection Method
```julia
# Mencari akar dari f(x) = x² - 4 dalam interval [0, 3]
include("src/root-finding/Bisection.jl")

f(x) = x^2 - 4
root = bisection(f, 0, 3, tol=1e-6)
println("Akar ditemukan: ", root)
# Output: Akar ditemukan: 2.000000
```

### Simpson's Rule
```julia
# Menghitung integral dari f(x) = x² dari 0 sampai 2
include("src/integration/Simpson.jl")

f(x) = x^2
result = simpson(f, 0, 2, n=100)
println("Hasil integrasi: ", result)
# Output: Hasil integrasi: 2.6667
```

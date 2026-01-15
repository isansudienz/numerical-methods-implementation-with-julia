# Numerical Methods Implementation with Julia

![Julia](https://img.shields.io/badge/Julia-9558B2?style=for-the-badge&logo=julia&logoColor=white)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

Collection of numerical analysis methods implemented in Julia, including root-finding algorithms, numerical integration techniques, Runge-Kutta methods, and optimization algorithms for scientific computing.

---

## 📑 Table of Contents

- [About](#-about)
- [Struktur Project](#-struktur-project)
- [Metode yang Diimplementasikan](#-metode-yang-diimplementasikan)
- [Cara Menjalankan](#-cara-menjalankan)
- [Contoh Penggunaan](#-contoh-penggunaan)
- [Prerequisites](#-prerequisites)
- [Dependencies](#-dependencies)
- [Author](#-author)

---

## 📖 About

Repository ini berisi implementasi berbagai metode numerik yang umum digunakan dalam analisis numerik dan komputasi ilmiah. Setiap metode diimplementasikan dalam Julia dengan fokus pada keterbacaan kode dan akurasi hasil.

---

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

---

## 📚 Metode yang Diimplementasikan

### 🎯 Root Finding Methods (Pencarian Akar)

#### 1. **Bisection Method**
Metode yang membagi interval menjadi dua bagian secara berulang untuk menemukan akar persamaan. Metode ini dijamin konvergen jika fungsi kontinu dan terdapat perubahan tanda dalam interval.

**Kelebihan:**
- Selalu konvergen
- Sederhana dan mudah dipahami
- Tidak memerlukan turunan

**Kekurangan:**
- Konvergensi lambat
- Memerlukan interval awal dengan perubahan tanda

---

#### 2. **Newton-Raphson Method**
Metode iteratif yang menggunakan turunan fungsi untuk mencari akar dengan kecepatan konvergensi kuadratik.

**Kelebihan:**
- Konvergensi sangat cepat (kuadratik)
- Akurasi tinggi

**Kekurangan:**
- Memerlukan turunan fungsi
- Sensitif terhadap tebakan awal
- Mungkin divergen jika tebakan awal buruk

---

#### 3. **Euler Method**
Metode numerik untuk menyelesaikan persamaan diferensial biasa (ODE) dengan pendekatan linear sederhana.

**Kelebihan:**
- Konsep sederhana
- Mudah diimplementasikan

**Kekurangan:**
- Akurasi rendah
- Error akumulasi tinggi untuk step size besar

---

### ∫ Numerical Integration (Integrasi Numerik)

#### 1. **Trapezoidal Rule**
Metode integrasi yang mengaproksimasi area di bawah kurva menggunakan trapesium.

**Rumus:**
```
∫[a,b] f(x)dx ≈ (b-a)/2 × [f(a) + f(b)]
```

**Akurasi:** O(h²) - akurasi orde 2

---

#### 2. **Simpson's 1/3 Rule**
Metode integrasi yang menggunakan parabola (polinomial orde 2) untuk mengaproksimasi kurva.

**Rumus:**
```
∫[a,b] f(x)dx ≈ (b-a)/6 × [f(a) + 4f((a+b)/2) + f(b)]
```

**Akurasi:** O(h⁴) - lebih akurat dari Trapezoidal

---

#### 3. **Simpson's 3/8 Rule**
Varian Simpson yang menggunakan 3 interval dengan bobot berbeda.

**Rumus:**
```
∫[a,b] f(x)dx ≈ (3h/8) × [f(x₀) + 3f(x₁) + 3f(x₂) + f(x₃)]
```

**Akurasi:** O(h⁴) - sama dengan Simpson 1/3 tetapi dengan interval berbeda

---

### 🔄 Runge-Kutta Methods

#### 1. **2nd Order Runge-Kutta (RK2)**
Metode untuk menyelesaikan persamaan diferensial dengan akurasi orde 2.

**Aplikasi:**
- Sistem dinamis sederhana
- Model populasi
- Persamaan gerak

---

#### 2. **4th Order Runge-Kutta (RK4)**
Metode RK klasik dengan akurasi tinggi (orde 4), paling populer untuk menyelesaikan ODE.

**Kelebihan:**
- Akurasi sangat tinggi
- Stabil untuk berbagai masalah
- Standard dalam komputasi ilmiah

**Aplikasi:**
- Simulasi fisika
- Model dinamika fluida
- Sistem kontrol

---

### 📈 Optimization Methods

Implementasi algoritma untuk mencari nilai maksimum atau minimum fungsi.

**Metode yang diimplementasikan:**
- Gradient descent
- Golden section search
- Numerical optimization techniques

---

## 🚀 Cara Menjalankan

### Prerequisites

Pastikan Julia sudah terinstall di sistem kamu.

**Download Julia:**
```
https://julialang.org/downloads/
```

**Cek instalasi:**
```bash
julia --version
```

---

### Menjalankan Program

**Method 1: Julia REPL**
```bash
# Buka Julia REPL
julia

# Include file yang ingin dijalankan
include("src/root-finding/Bisection.jl")
```

**Method 2: Command Line**
```bash
# Jalankan langsung dari terminal
julia src/root-finding/Bisection.jl
```

**Method 3: Dari folder tertentu**
```bash
cd src/integration
julia Simpson.jl
```

---

## 💡 Contoh Penggunaan

### Example 1: Bisection Method
```julia
# Mencari akar dari f(x) = x² - 4 dalam interval [0, 3]
include("src/root-finding/Bisection.jl")

# Definisi fungsi
f(x) = x^2 - 4

# Panggil metode bisection
root = bisection(f, 0, 3, tol=1e-6, max_iter=100)

println("Akar yang ditemukan: ", root)
# Output: Akar yang ditemukan: 2.000000

# Verifikasi
println("f(root) = ", f(root))
# Output: f(root) ≈ 0.000000
```

---

### Example 2: Newton-Raphson Method
```julia
include("src/root-finding/newtonraphson.jl")

# Mencari akar x³ - x - 2 = 0
f(x) = x^3 - x - 2
df(x) = 3x^2 - 1  # turunan

x0 = 1.5  # tebakan awal
root = newton_raphson(f, df, x0, tol=1e-8)

println("Akar: ", root)
# Output: Akar: 1.521379707
```

---

### Example 3: Simpson's Rule Integration
```julia
include("src/integration/Simpson.jl")

# Menghitung integral ∫₀² x² dx
# Hasil analitik: [x³/3]₀² = 8/3 ≈ 2.6667

f(x) = x^2
result = simpson(f, 0, 2, n=100)

println("Hasil integrasi: ", result)
# Output: Hasil integrasi: 2.6667

println("Error: ", abs(result - 8/3))
# Output: Error: ~0.0000
```

---

### Example 4: Trapezoidal Rule
```julia
include("src/integration/TrapezoidIntegral.jl")

# Integral dari sin(x) dari 0 sampai π
# Hasil analitik: [-cos(x)]₀^π = 2

f(x) = sin(x)
result = trapezoidal(f, 0, π, n=1000)

println("Hasil: ", result)
# Output: Hasil: ≈ 2.0000

println("Akurasi: ", abs(result - 2.0))
```

---

### Example 5: Runge-Kutta 4th Order
```julia
include("src/numerical-methods/rungekutta4order.jl")

# Menyelesaikan dy/dx = -2xy dengan y(0) = 1
# Solusi analitik: y = e^(-x²)

f(x, y) = -2 * x * y
x0, y0 = 0.0, 1.0
h = 0.1  # step size
x_end = 1.0

result = rk4(f, x0, y0, h, x_end)

println("Solusi numerik di x=1.0: ", result)
println("Solusi analitik: ", exp(-1.0))
println("Error: ", abs(result - exp(-1.0)))
```

---

## 📋 Prerequisites

- **Julia** versi 1.x atau lebih tinggi
- Tidak ada package eksternal yang diperlukan (menggunakan Base Julia)

---

## 📦 Dependencies

Semua implementasi menggunakan **Base Julia** tanpa dependencies eksternal, sehingga dapat langsung dijalankan setelah instalasi Julia tanpa perlu instalasi package tambahan.

---

## ⚙️ Modifikasi dan Ekstensi

Setiap file dapat dimodifikasi sesuai kebutuhan:

**Mengubah toleransi error:**
```julia
root = bisection(f, a, b, tol=1e-10)  # akurasi lebih tinggi
```

**Mengubah jumlah iterasi maksimum:**
```julia
root = newton_raphson(f, df, x0, max_iter=200)
```

**Mengubah step size untuk integrasi:**
```julia
result = simpson(f, a, b, n=500)  # lebih banyak subdivisi
```

---

## 🎓 Catatan Pembelajaran

### Tips Penggunaan:

1. **Bisection vs Newton-Raphson:**
   - Gunakan Bisection jika tidak ada turunan atau untuk keamanan konvergensi
   - Gunakan Newton-Raphson untuk konvergensi cepat dengan tebakan awal yang baik

2. **Simpson vs Trapezoidal:**
   - Simpson lebih akurat (O(h⁴) vs O(h²))
   - Trapezoidal lebih sederhana dan cepat untuk fungsi linear

3. **Runge-Kutta:**
   - RK2 cukup untuk masalah sederhana
   - RK4 lebih baik untuk masalah kompleks atau yang memerlukan akurasi tinggi

---

## 🤝 Contributing

Contributions, issues, dan feature requests sangat diterima!

Jika ingin berkontribusi:
1. Fork repository ini
2. Buat branch fitur (`git checkout -b feature/AmazingFeature`)
3. Commit perubahan (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

---

## 📄 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Isan**

- GitHub: [@isansudienz](https://github.com/isansudienz)
- Repository: [numerical-methods-implementation-with-julia](https://github.com/isansudienz/numerical-methods-implementation-with-julia)

---

## 🙏 Acknowledgments

- Mata Kuliah Metode Numerik
- Julia Programming Language Documentation
- Numerical Analysis Textbooks and Resources

---

⭐ If you find this repository helpful, please consider giving it a star!

---

**Last Updated:** January 2026

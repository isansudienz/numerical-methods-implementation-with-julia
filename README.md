# Numerical Methods Implementation with Julia

[![Julia](https://img.shields.io/badge/Julia-9558B2?style=for-the-badge&logo=julia&logoColor=white)](https://julialang.org/)
[![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)](https://github.com/isansudienz/numerical-methods-implementation-with-julia)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](./LICENSE)

Collection of numerical analysis methods implemented in Julia, including root-finding algorithms, numerical integration techniques, Runge-Kutta methods, and optimization algorithms for scientific computing.

---

## 📑 Table of Contents

* [About](#-about)
* [Project Structure](#-project-structure)
* [Implemented Methods](#-implemented-methods)
* [Getting Started](#-getting-started)
* [Usage Examples](#-usage-examples)
* [Prerequisites](#-prerequisites)
* [Contributing](#-contributing)
* [License](#-license)
* [Author](#-author)

---

## 📖 About

Repository ini berisi implementasi berbagai metode numerik yang umum digunakan dalam analisis numerik dan komputasi ilmiah. Setiap metode diimplementasikan dalam Julia dengan fokus pada keterbacaan kode dan akurasi hasil.

**Key Features:**
- ✅ Pure Julia implementation (no external dependencies)
- ✅ Well-documented code with examples
- ✅ Educational focus with detailed explanations
- ✅ Ready-to-use implementations

---

## 📁 Project Structure

```
numerical-methods-implementation-with-julia/
├── src/
│   ├── root-finding/          # Root-finding algorithms
│   │   ├── Bisection.jl
│   │   ├── NewtonRaphson.jl
│   │   └── Euler.jl
│   │
│   ├── ode-solvers/           # Ordinary Differential Equations solvers
│   │   ├── RungeKutta2Order.jl
│   │   └── RungeKutta4Order.jl
│   │
│   ├── integration/           # Numerical integration methods
│   │   ├── TrapezoidIntegral.jl
│   │   ├── Simpson.jl
│   │   └── Simpson3Per8.jl
│   │
│   └── optimization/          # Optimization algorithms
│       └── Optimization.jl
│
├── LICENSE
├── Project.toml
├── .gitignore
└── README.md
```

---

## 📚 Implemented Methods

### 🎯 Root Finding Methods

| Method | File | Convergence | Features |
|--------|------|-------------|----------|
| **Bisection** | `Bisection.jl` | Linear | Guaranteed convergence, no derivatives needed |
| **Newton-Raphson** | `NewtonRaphson.jl` | Quadratic | Fast convergence, requires derivative |
| **Euler** | `Euler.jl` | Linear | Simple ODE solver |

#### 1. Bisection Method
Metode yang membagi interval menjadi dua bagian secara berulang untuk menemukan akar persamaan.

**Kelebihan:**
- Selalu konvergen jika fungsi kontinu
- Tidak memerlukan turunan fungsi
- Robust dan mudah diimplementasikan

**Kekurangan:**
- Konvergensi lambat (linear)
- Memerlukan interval dengan perubahan tanda

---

#### 2. Newton-Raphson Method
Metode iteratif yang menggunakan turunan fungsi untuk mencari akar dengan konvergensi kuadratik.

**Kelebihan:**
- Konvergensi sangat cepat (quadratic)
- Akurasi tinggi dalam sedikit iterasi

**Kekurangan:**
- Memerlukan turunan fungsi
- Sensitif terhadap initial guess
- Bisa divergen jika starting point buruk

---

### ∫ Numerical Integration

| Method | File | Order | Accuracy |
|--------|------|-------|----------|
| **Trapezoidal Rule** | `TrapezoidIntegral.jl` | O(h²) | Good for smooth functions |
| **Simpson's 1/3** | `Simpson.jl` | O(h⁴) | Higher accuracy |
| **Simpson's 3/8** | `Simpson3Per8.jl` | O(h⁴) | Alternative Simpson method |

#### 1. Trapezoidal Rule
Mengaproksimasi integral menggunakan trapesium.

**Formula:**
```
∫[a,b] f(x)dx ≈ (b-a)/2 × [f(a) + f(b)]
```

**Accuracy:** O(h²)
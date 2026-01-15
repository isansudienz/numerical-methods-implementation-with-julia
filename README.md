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
│   │   ├── Simpson1Per3.jl
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

---

#### 2. Simpson's 1/3 Rule
Menggunakan parabola (polynomial orde 2) untuk aproksimasi yang lebih akurat.

**Formula:**
```
∫[a,b] f(x)dx ≈ (b-a)/6 × [f(a) + 4f((a+b)/2) + f(b)]
```

**Accuracy:** O(h⁴) - significantly more accurate than Trapezoidal

---

#### 3. Simpson's 3/8 Rule
Varian Simpson menggunakan 3 interval dengan bobot berbeda.

**Formula:**
```
∫[a,b] f(x)dx ≈ (3h/8) × [f(x₀) + 3f(x₁) + 3f(x₂) + f(x₃)]
```

**Accuracy:** O(h⁴)

---

### 🔄 Runge-Kutta Methods (ODE Solvers)

| Method | File | Order | Use Case |
|--------|------|-------|----------|
| **RK2** | `RungeKutta2Order.jl` | O(h²) | Simple differential equations |
| **RK4** | `RungeKutta4Order.jl` | O(h⁴) | Standard high-accuracy ODE solver |

#### 1. 2nd Order Runge-Kutta (RK2)
Metode untuk menyelesaikan ODE dengan akurasi orde 2.

**Applications:**
- Simple dynamical systems
- Population models
- Basic motion equations

---

#### 2. 4th Order Runge-Kutta (RK4)
The classic Runge-Kutta method - most popular ODE solver in scientific computing.

**Advantages:**
- Very high accuracy (4th order)
- Stable for wide range of problems
- Industry standard for ODE solving

**Applications:**
- Physics simulations
- Fluid dynamics
- Control systems
- Chemical kinetics

---

### 📈 Optimization Methods

Implementation of algorithms to find function maxima/minima.

**Implemented methods:**
- Gradient descent
- Golden section search
- Numerical optimization techniques

---

## 🚀 Getting Started

### Prerequisites

**Required:**
- Julia 1.x or higher

**Download Julia:**
```
https://julialang.org/downloads/
```

**Verify installation:**
```bash
julia --version
```

---

### Installation

**Clone the repository:**
```bash
git clone https://github.com/isansudienz/numerical-methods-implementation-with-julia.git
cd numerical-methods-implementation-with-julia
```

---

### Running the Code

**Method 1: Julia REPL**
```julia
# Start Julia REPL
julia

# Include and run a method
include("src/root-finding/Bisection.jl")
```

**Method 2: Command Line**
```bash
# Run directly from terminal
julia src/root-finding/Bisection.jl
```

**Method 3: From specific folder**
```bash
cd src/integration
julia Simpson.jl
```

---

## 💡 Usage Examples

### Example 1: Bisection Method

```julia
include("src/root-finding/Bisection.jl")

# Find root of f(x) = x² - 4 in interval [0, 3]
f(x) = x^2 - 4

root = bisection(f, 0, 3, tol=1e-6, max_iter=100)

println("Root found: ", root)
# Output: Root found: 2.000000

# Verify
println("f(root) = ", f(root))
# Output: f(root) ≈ 0.000000
```

---

### Example 2: Newton-Raphson Method

```julia
include("src/root-finding/NewtonRaphson.jl")

# Find root of x³ - x - 2 = 0
f(x) = x^3 - x - 2
df(x) = 3x^2 - 1  # derivative

x0 = 1.5  # initial guess
root = newton_raphson(f, df, x0, tol=1e-8)

println("Root: ", root)
# Output: Root: 1.521379707
```

---

### Example 3: Simpson's Rule Integration

```julia
include("src/integration/Simpson.jl")

# Calculate ∫₀² x² dx
# Analytical result: [x³/3]₀² = 8/3 ≈ 2.6667

f(x) = x^2
result = simpson(f, 0, 2, n=100)

println("Integration result: ", result)
# Output: Integration result: 2.6667

println("Error: ", abs(result - 8/3))
# Output: Error: ~0.0000
```

---

### Example 4: Trapezoidal Rule

```julia
include("src/integration/TrapezoidIntegral.jl")

# Integrate sin(x) from 0 to π
# Analytical result: [-cos(x)]₀^π = 2

f(x) = sin(x)
result = trapezoidal(f, 0, π, n=1000)

println("Result: ", result)
# Output: Result: ≈ 2.0000

println("Accuracy: ", abs(result - 2.0))
```

---

### Example 5: Runge-Kutta 4th Order

```julia
include("src/ode-solvers/RungeKutta4Order.jl")

# Solve dy/dx = -2xy with y(0) = 1
# Analytical solution: y = e^(-x²)

f(x, y) = -2 * x * y
x0, y0 = 0.0, 1.0
h = 0.1  # step size
x_end = 1.0

result = rk4(f, x0, y0, h, x_end)

println("Numerical solution at x=1.0: ", result)
println("Analytical solution: ", exp(-1.0))
println("Error: ", abs(result - exp(-1.0)))
```

---

## 📋 Prerequisites

* **Julia** version 1.x or higher
* No external packages required (pure Base Julia)

---

## 📦 Dependencies

All implementations use **Base Julia** only - no external dependencies needed. You can run the code immediately after installing Julia without any package installations.

---

## ⚙️ Customization

Each method can be customized for your specific needs:

**Adjust error tolerance:**
```julia
root = bisection(f, a, b, tol=1e-10)  # higher precision
```

**Change maximum iterations:**
```julia
root = newton_raphson(f, df, x0, max_iter=200)
```

**Modify integration step size:**
```julia
result = simpson(f, a, b, n=500)  # more subdivisions
```

---

## 🎓 Learning Notes

### Method Comparison:

#### Bisection vs Newton-Raphson
- Use **Bisection** when:
  - No derivative available
  - Need guaranteed convergence
  - Working with discontinuous functions
- Use **Newton-Raphson** when:
  - Derivative is available
  - Need fast convergence
  - Have good initial guess

#### Simpson vs Trapezoidal
- **Simpson's Rule:**
  - More accurate (O(h⁴) vs O(h²))
  - Better for smooth curves
  - Recommended for most cases
- **Trapezoidal Rule:**
  - Simpler implementation
  - Faster for linear functions
  - Good for quick estimates

#### Runge-Kutta Selection
- **RK2:** Sufficient for simple problems, faster computation
- **RK4:** Better for complex problems requiring high accuracy

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

To contribute:

1. Fork this repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

---

## 👨‍💻 Author

**Isan**

* GitHub: [@isansudienz](https://github.com/isansudienz)
* Repository: [numerical-methods-implementation-with-julia](https://github.com/isansudienz/numerical-methods-implementation-with-julia)

---

## 🙏 Acknowledgments

* Mata Kuliah Metode Numerik
* Julia Programming Language Documentation
* Numerical Analysis Textbooks and Resources

---

## 📊 Project Status

![GitHub last commit](https://img.shields.io/github/last-commit/isansudienz/numerical-methods-implementation-with-julia)
![GitHub issues](https://img.shields.io/github/issues/isansudienz/numerical-methods-implementation-with-julia)
![GitHub pull requests](https://img.shields.io/github/issues-pr/isansudienz/numerical-methods-implementation-with-julia)

---

⭐ **If you find this repository helpful, please consider giving it a star!**

---

**Last Updated:** January 2026
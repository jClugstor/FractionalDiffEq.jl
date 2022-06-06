"""
    solve(prob::FODESystem, h, NewtonPolynomial())

Solve FODE system using Newton Polynomials methods.

```tex
https://doi.org/10.1016/c2020-0-02711-8
```
"""
struct NewtonPolynomial <: FractionalDiffEqAlgorithm end

function solve(prob::FODESystem, h, ::NewtonPolynomial)
    @unpack f, α, u0, tspan = prob
    t0 = tspan[1]; tfinal = tspan[2]
    α = α[1];
    t = collect(t0:h:tfinal)
    M = 1-α+α/gamma(α)
    N::Int = ceil(Int, (tfinal-t0)/h)
    l = length(u0)
    result = zeros(3, N+1)

    result[:, 1]=u0
    temp = zeros(l)
    f(temp, result[:, 1], nothing, t[1])
    result[:, 2] = result[:, 1]+h.*temp
    temptemp = zeros(l)
    f(temptemp, result[:, 2], nothing, t[2])
    result[:, 3] = result[:, 2]+(h/2).*(3 .*temptemp-temp)

    temp1 = zeros(l)
    temp2 = zeros(l)
    temp3 = zeros(l)

    for n=3:N
        f(temp1, result[:, n], nothing, t[n])
        f(temp2, result[:, n-1], nothing, t[n-1])
        f(temp3, result[:, n-2], nothing, t[n-2])
        result[:, n+1] = result[:, n] + (1-α)/M*(temp1-temp2)+α.*M.*h.*(23/12*temp1-4/3*temp2+5/12*temp3)
    end
    return result
end
module FractionalDiffEq

using LinearAlgebra
using SpecialFunctions
using SparseArrays
using InvertedIndices: Not
using SpecialMatrices: Vandermonde
using FFTW: fft, ifft
using UnPack: @unpack
using LoopVectorization: @turbo
using HypergeometricFunctions
using ToeplitzMatrices
using RecipesBase
using ForwardDiff
using Polynomials: Polynomial

include("types/problems.jl")
include("types/algorithms.jl")
include("types/solutions.jl")


# Single-term fractional ordinary differential equations
include("singletermfode/PECE.jl")
include("singletermfode/PI.jl")
include("singletermfode/GL.jl")
include("singletermfode/AtanganaSeda.jl")
include("singletermfode/Euler.jl")

# Multi-terms fractional ordinary differential equations
include("multitermsfode/matrix.jl")
include("multitermsfode/hankelmatrix.jl")
include("multitermsfode/ClosedForm.jl")
include("multitermsfode/MTPIEX.jl")
include("multitermsfode/MTPIPECE.jl")
include("multitermsfode/MTPIIMTrap.jl")
include("multitermsfode/MTPIIMRect.jl")

# System of fractional ordinary differential equations
include("fodesystem/PIPECE.jl")
include("fodesystem/FLMMBDF.jl")
include("fodesystem/FLMMNewtonGregory.jl")
include("fodesystem/FLMMTrap.jl")
include("fodesystem/PIEX.jl")
include("fodesystem/Euler.jl")
include("fodesystem/GLWithMemory.jl")
include("fodesystem/NonLinear.jl")
include("fodesystem/NewtonPolynomial.jl")
include("fodesystem/AS.jl")
include("fodesystem/ASCF.jl")

# System of fractal-fractional ordinary differential equations
include("ffode/AS.jl")

# Fractional partial differential equations
include("FPDE/FiniteDiffEx.jl")
include("FPDE/FiniteDiffIm.jl")
include("FPDE/CaputoDiscrete.jl")
include("FPDE/GL.jl")

# Fractional delay differential equations
include("FDDE/DelayPECE.jl")
include("FDDE/DelayPI.jl")
include("FDDE/Matrix.jl")
include("FDDE/DelayABM.jl")
include("FDDE/DelayABMSystem.jl")

# Distributed order differential equations
include("dode/utils.jl")
include("dode/matrix.jl")

# Fractional Differences equations
include("FractionalDifferences/PECE.jl")
include("FractionalDifferences/GL.jl")

# Mittag Leffler function
include("mlfun.jl")

# Lyapunov exponents
include("FOLE.jl")

include("utils.jl")
include("auxiliary.jl")

# General types
export solve, FDEProblem

# FPDE problems
export FPDEProblem

# FDDE problems
export FDDEProblem, FDDESystem, FDDEMatrixProblem

# FODE problems
export SingleTermFODEProblem, MultiTermsFODEProblem, FODESystem, DODEProblem, FFPODEProblem, FFEODEProblem, FFMODEProblem

# Fractional Difference probelms
export FractionalDifferenceProblem, FractionalDifferenceSystem


###################################################


export AbstractFDESolution
export FODESolution, FDifferenceSolution, DODESolution, FFMODESolution
export FODESystemSolution, FDDESystemSolution, FFMODESystem

# FODE solvers
export PIEX, PIPECE, PIIMRect, PIIMTrap
export PECE, FODEMatrixDiscrete, ClosedForm, ClosedFormHankelM, GL
export AtanganaSeda, AtanganaSedaAB
export Euler

# FPDE solvers
export FPDEMatrixDiscrete, FiniteDiffEx, FiniteDiffIm, ADV_DIF, GLDiff

# System of FODE solvers
export NonLinearAlg, GLWithMemory, FLMMBDF, FLMMNewtonGregory, FLMMTrap, PIEX, NewtonPolynomial
export AtanganaSedaCF

# FDDE solvers
export DelayPECE, DelayPI, DelayABM, MatrixForm

# DODE solvers
export DOMatrixDiscrete

# Fractional Differences Equations solvers
export PECEDifference

# Fractional Integral Equations solvers
export SpectralUltraspherical

###################################################

# Export some api to construct the equation
export eliminator, RieszMatrix, omega, meshgrid

# Export some special models
export bagleytorvik, diffusion

# Auxiliary functions
export mittleff, mittleffderiv

# Lyapunov exponents
export FOLyapunov

# Distributed order auxiliary SpecialFunctions
export DOB, DOF, DORANORT, isFunction

export ourfft, ourifft, rowfft, FastConv

end
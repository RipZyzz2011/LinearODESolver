module LinearODESolver
using Plots
using DifferentialEquations
using Test

export define_system, solve_system, plot_solution

function define_system(A::Matrix, u0::Vector, tspan::Tuple)
    function LinearODE!(du, u, p, t)
        du .= A * u
    end

    return ODEProblem(LinearODE!, u0, tspan)
end

function solve_system(prob::ODEProblem)
    return solve(prob)
end

function plot_solution(sol::ODESolution)
    plot(sol, xlabel = "Time", ylabel = "y", title = "Solution of ODE with A")
end



end

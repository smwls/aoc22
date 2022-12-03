module Day2
using LinearAlgebra

struct Round
    first::BitMatrix
    second::BitMatrix
end

W = [0 0 1; 1 0 0; 0 1 0]
R = W - W'
M = diagm([1, 2, 3])

score_round_1(x::Round) = sum(M*x.second) + 3(sum(-x.first * R * x.second)) + 3
score_round_2(x::Round) = score_round_1(Round(x.first, W^(1 + (1:3)[vec(x.second) .== 1][1])*x.first'))

parse_round(x::SubString{String})::Round = begin
    first, second = split(x, " ") .|> x -> occursin.(x,["AX" "BY" "CZ"])
    return Round(first, second')
end

parse_input(x::String)::Vector{Round} = split(x, "\n") .|> parse_round

read_input(fname::String) = open(fname, "r") do io
    return parse_input(read(io, String))
end

solution_1 = "./inputs/2_1" |> read_input .|> score_round_1 |> sum
solution_2 = "./inputs/2_1" |> read_input .|> score_round_2 |> sum

println(solution_1)
println(solution_2)
end
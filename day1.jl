module Day1

parse_input(x::String)::Vector{Vector{Int}} = split(x, "\n\n") .|> x -> parse.(Int, split(x, "\n"))

read_input(fname::String) = open(fname, "r") do io
    return parse_input(read(io, String))
end

solution_1() = "./inputs/1_1" |> read_input .|> sum |> maximum
solution_2() = "./inputs/1_1" |> read_input .|> sum |> sort |> x -> x[end-2:end] |> sum

println(solution_1())
println(solution_2())
end
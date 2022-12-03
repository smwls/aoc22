module Day3

priority(x::Char)::Int = findfirst(y->y==x, vcat('a':'z', 'A':'Z'))
divide_into_pair(chars::Vector{Char})::Tuple{Vector{Char}, Vector{Char}} = chars[begin:div(end, 2)], chars[div(end,2)+1:end]
groups(x::Vector{Vector{Char}})::Vector{Vector{Vector{Char}}} = [x[i:i+2] for i in 1:3:(length(x)-2)]

parse_input(x::String)  = split(x, "\n") .|> collect
read_input(fname::String) = open(fname, "r") do io
    return parse_input(read(io, String))
end

solution_1() = reduce(hcat, ("./inputs/3_1" |> read_input .|> divide_into_pair .|> x -> intersect(x...) .|> priority)') |> sum
solution_2() = reduce(hcat, ("./inputs/3_1" |> read_input |> groups .|> y -> intersect(y...) .|> priority)') |> sum
println(solution_1())
println(solution_2())
end
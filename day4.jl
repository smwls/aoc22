module Day4

const SectionPair = Vector{Vector{Int}}
fully_contains(((a, b), (c, d))::SectionPair)::Bool = (a - c)*(b - d) <= 0
overlaps(((a, b), (c, d))::SectionPair)::Bool  = (b - c) * (d - a) >= 0

parse_interval(x::SubString{String})::Vector{Int} = split(x, "-") .|> x -> parse(Int, x)
parse_pair(x::SubString{String})::SectionPair = split(x, ",") .|> parse_interval
parse_input(x::String)::Vector{SectionPair}  = split(x, "\n") .|> parse_pair
read_input(fname::String)::Vector{SectionPair} = open(fname, "r") do io
    return parse_input(read(io, String))
end

solution_1()::Int = "./inputs/4_1" |> read_input .|> fully_contains |> sum
solution_2()::Int =  "./inputs/4_1" |> read_input .|> overlaps |> sum

println(solution_1())
println(solution_2())
end
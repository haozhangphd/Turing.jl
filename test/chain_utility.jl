using Turing: Chain, Sample
using Base.Test

c = Chain()
@test string(c) == "Empty Chain, weight 0.0"

d = Dict{Symbol, Any}()
d[:m] = [1,2,3]
s = Sample(1, d)

c2 = Chain(1, Vector{Sample}([s]))

string(c2)
samples = c2[:samples]
@test samples[1][:m] == d[:m]

@test mean(c2, :m, x -> x) == [1.0, 2.0, 3.0]

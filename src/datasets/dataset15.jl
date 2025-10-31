"""
Universal Dataset Number: 15

**Name:   Nodes**

             Record 1: FORMAT(4I10,1P3E13.5)
                       Field 1   -  node label
                       Field 2   -  definition coordinate system number
                       Field 3   -  displacement coordinate system number
                       Field 4   -  color
                       Field 5-7 -  3 - Dimensional coordinates of node
                                    in the definition system

             NOTE:  Repeat record for each node
"""
function parse_dataset15(block)
    nlines = length(block)

    node_ID = Int[]
    def_cs_num = Int[]
    disp_cs_num = Int[]
    color = Int[]
    coords = Vector{Float64}[]

    i = 2
    while i ≤ nlines
        r1 = split(block[i])
        nid, dcs, disp_cs, col = parse.(Int, strip.(r1[1:4]))
        x, y, z = parse.(Float64, strip.(r1[5:end]))

        push!(node_ID, nid)
        push!(def_cs_num, dcs)
        push!(disp_cs_num, disp_cs)
        push!(color, col)
        push!(coords, [x, y, z])

        i += 1
    end

    return Dataset15(
        node_ID,
        def_cs_num,
        disp_cs_num,
        color,
        coords
    )
end

function write_dataset15(dataset::Dataset15)
    # Function implementation goes here
end
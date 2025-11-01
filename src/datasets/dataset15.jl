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

"""
    write_dataset15(dataset::Dataset15) -> Vector{String}

Write a UFF Dataset 15 (Nodes) to a vector of strings.

**Input**
- `dataset::Dataset15`: The dataset structure containing node information

**Output**
- `Vector{String}`: Vector of formatted strings representing the UFF file content
"""
function write_dataset15(dataset::Dataset15)
    lines = String[]

    # Write header
    push!(lines, "    -1")
    push!(lines, "    15")

    # Write node data
    for i in eachindex(dataset.node_ID)
        # Format: 4I10 for integers, 1P3E13.5 for coordinates
        line = @sprintf("%10d%10d%10d%10d%13.5E%13.5E%13.5E",
            dataset.node_ID[i],
            dataset.def_cs_num[i],
            dataset.disp_cs_num[i],
            dataset.color[i],
            dataset.coords[i][1],
            dataset.coords[i][2],
            dataset.coords[i][3]
        )
        push!(lines, line)
    end

    # Write footer
    push!(lines, "    -1")

    return lines
end
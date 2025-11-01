"""
Universal Dataset Number: 82

**Name:   Tracelines**

             Record 1: FORMAT(3I10)
                       Field 1 -    trace line number
                       Field 2 -    number of nodes defining trace line
                                    (maximum of 250)
                       Field 3 -    color

             Record 2: FORMAT(80A1)
                       Field 1 -    Identification line

             Record 3: FORMAT(8I10)
                       Field 1 -    nodes defining trace line
                               =    > 0 draw line to node
                               =    0 move to node (a move to the first
                                    node is implied)
             Notes: 1) MODAL-PLUS node numbers must not exceed 8000.
                    2) Identification line may not be blank.
                    3) Systan only uses the first 60 characters of the
                       identification text.
                    4) MODAL-PLUS does not support trace lines longer than
                       125 nodes.
                    5) Supertab only uses the first 40 characters of the
                       identification line for a name.
                    6) Repeat Datasets for each Trace_Line
"""
function parse_dataset82(block)
    line_number, num_nodes, color = parse.(Int, split(block[2]))
    id_line = strip(block[3])

    lblock = block[4:end]
    line_nodes = Int[]
    for line in lblock
        append!(line_nodes, parse.(Int, split(line)))
    end

    return Dataset82(
        line_number,
        num_nodes,
        color,
        id_line,
        line_nodes
    )
end

"""
    write_dataset82(dataset::Dataset82) -> Vector{String}

Write a UFF Dataset 82 (Tracelines) to a vector of strings.

**Input**
- `dataset::Dataset82`: The dataset structure containing trace line information

**Output**
- `Vector{String}`: Vector of formatted strings representing the UFF file content
"""
function write_dataset82(dataset::Dataset82)
    lines = String[]

    # Write header
    push!(lines, "    -1")
    push!(lines, "    82")

    # Write Record 1: FORMAT(3I10)
    # Field 1: trace line number
    # Field 2: number of nodes
    # Field 3: color
    line1 = @sprintf("%10d%10d%10d",
        dataset.line_number,
        dataset.num_nodes,
        dataset.color
    )
    push!(lines, line1)

    # Write Record 2: FORMAT(80A1)
    # Identification line (max 80 characters)
    id_line = rpad(dataset.id_line[1:min(length(dataset.id_line), 80)], 0)
    push!(lines, id_line)

    # Write Record 3: FORMAT(8I10)
    # Node numbers, 8 per line
    for i in 1:8:length(dataset.line_nodes)
        # Get up to 8 nodes for this line
        end_idx = min(i + 7, length(dataset.line_nodes))
        nodes_chunk = dataset.line_nodes[i:end_idx]

        # Format each node as I10 (10 characters, right-aligned)
        line_parts = [@sprintf("%10d", node) for node in nodes_chunk]
        push!(lines, join(line_parts, ""))
    end

    # Write footer
    push!(lines, "    -1")

    return lines
end
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

function write_dataset82(dataset::Dataset82)
    # Function implementation goes here
end
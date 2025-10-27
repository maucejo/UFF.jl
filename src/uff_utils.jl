"""
    extract_blocks(filepath::String) -> Vector{Vector{String}}

Extracts blocks of data from a UFF file located at `filepath`. Each block is delimited by lines containing `-1`.

**Input**
- `filepath::String`: Path to the UFF file.

**Output**
- `blocks::Vector{Vector{String}}`: A vector containing blocks of data, where each block is represented as a vector of strings.
"""
function extract_blocks(filepath::String)
    blocks = Vector{Vector{String}}()
    current_block = String[]
    in_block = false

    open(filepath, "r") do file
        for line in eachline(file)
            trimmed_line = strip(line)

            if trimmed_line == "-1"
                if !in_block
                    # Start of a new block
                    in_block = true
                else
                    # End of current block
                    if !isempty(current_block)
                        push!(blocks, copy(current_block))
                    end
                    empty!(current_block)
                    in_block = false
                end
            elseif in_block
                # Inside a block
                push!(current_block, trimmed_line)
            end
        end
    end
    return blocks
end
"""
Universal Dataset Number: 18

**Name:   Coordinate Systems**

            Record 1: FORMAT(5I10)
                 Field 1       -- coordinate system number
                 Field 2       -- coordinate system type
                 Field 3       -- reference coordinate system number
                 Field 4       -- color
                 Field 5       -- method of definition
                               = 1 - origin, +x axis, +xz plane

            Record 2: FORMAT(20A2)
                 Field 1       -- coordinate system name

            Record 3: FORMAT(1P6E13.5)
                 Total of 9 coordinate system definition parameters.
                 Fields 1-3    -- origin of new system specified in
                                  reference system
                 Fields 4-6    -- point on +x axis of the new system
                                  specified in reference system
                 Fields 7-9    -- point on +xz plane of the new system
                                  specified in reference system

Records 1 thru 3 are repeated for each coordinate system in the model.
"""
function parse_dataset18(block)
    nlines = length(block)

    cs_num = Int[]
    cs_type = Int[]
    ref_cs_num = Int[]
    color = Int[]
    method_def = Int[]
    cs_name = String[]
    cs_origin = Vector{Float64}[]
    cs_x = Vector{Float64}[]
    cs_xz = Vector{Float64}[]

    i = 2 # Start after the dataset type line
    while i ≤ nlines
        # Parse record 1
        csn, cst, ref_csn, col, md = parse.(Int, split(strip(block[i])))
        push!(cs_num, csn)
        push!(cs_type, cst)
        push!(ref_cs_num, ref_csn)
        push!(color, col)
        push!(method_def, md)

        # Parse record 2
        i += 1
        push!(cs_name, strip(block[i]))

        # Parse record 3
        _cs_params = Float64[]
        for _ in 1:2
            i += 1
            append!(_cs_params, parse.(Float64, split(strip(block[i]))))
        end
        push!(cs_origin, _cs_params[1:3])
        push!(cs_x, _cs_params[4:6])
        push!(cs_xz, _cs_params[7:9])

        i += 1 # Move to the next coordinate system
    end

    return Dataset18(
        cs_num,
        cs_type,
        ref_cs_num,
        color,
        method_def,
        cs_name,
        cs_origin,
        cs_x,
        cs_xz
    )
end

function write_dataset18(dataset::Dataset18)
    lines = String[]

    # Header
    push!(lines, "    -1")
    push!(lines, "    18")

    # Ensure we can iterate consistently over coordinate systems
    ncs = length(dataset.cs_num)

    for i in 1:ncs
        # Record 1: FORMAT(5I10) - 5 integers with width 10
        push!(
            lines,
            @sprintf("%10d%10d%10d%10d%10d",
                dataset.cs_num[i],
                dataset.cs_type[i],
                dataset.ref_cs_num[i],
                dataset.color[i],
                dataset.method_def[i]
            ),
        )

        # Record 2: FORMAT(20A2) - coordinate system name (40 characters)
        push!(lines, dataset.cs_name[i])

        # Record 3: FORMAT(1P6E13.5) - 9 coordinate system definition parameters
        # Split into 2 lines: first line has 6 values, second line has 3 values
        push!(
            lines,
            @sprintf("%13.5E%13.5E%13.5E%13.5E%13.5E%13.5E",
                dataset.cs_origin[i][1],
                dataset.cs_origin[i][2],
                dataset.cs_origin[i][3],
                dataset.cs_x[i][1],
                dataset.cs_x[i][2],
                dataset.cs_x[i][3]
            ),
        )
        push!(
            lines,
            @sprintf("%13.5E%13.5E%13.5E",
                dataset.cs_xz[i][1],
                dataset.cs_xz[i][2],
                dataset.cs_xz[i][3]
            ),
        )
    end

    # Footer
    push!(lines, "    -1")

    return lines
end
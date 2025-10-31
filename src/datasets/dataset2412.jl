"""
Universal Dataset Number: 2412

**Name:   Elements**

    Record 1: FORMAT(6I10)
                 Field 1       -- element label
                 Field 2       -- fe descriptor id
                 Field 3       -- physical property table number
                 Field 4       -- material property table number
                 Field 5       -- color
                 Field 6       -- number of nodes on element

    Record 2:  *** FOR NON-BEAM ELEMENTS ***
                 FORMAT(8I10)
                 Fields 1-n    -- node labels defining element

    Record 2:  *** FOR BEAM ELEMENTS ONLY ***
                 FORMAT(3I10)
                 Field 1       -- beam orientation node number
                 Field 2       -- beam fore-end cross section number
                 Field 3       -- beam  aft-end cross section number

    Record 3:  *** FOR BEAM ELEMENTS ONLY ***
                 FORMAT(8I10)
                 Fields 1-n    -- node labels defining element

    Records 1 and 2 are repeated for each non-beam element in the model.
    Records 1 - 3 are repeated for each beam element in the model.

    FE Descriptor Id
-----------------------------------------------------------------------

    11 Rod

    21 Linear beam

    22 Tapered beam

    23 Curved beam

    24 Parabolic beam

    31 Straight pipe

    32 Curved pipe

    41 Plane Stress Linear Triangle

    42 Plane Stress Parabolic Triangle

    43 Plane Stress Cubic Triangle

    44 Plane Stress Linear Quadrilateral

    45 Plane Stress Parabolic Quadrilateral

    46 Plane Strain Cubic Quadrilateral

    51 Plane Strain Linear Triangle

    52 Plane Strain Parabolic Triangle

    53 Plane Strain Cubic Triangle

    54 Plane Strain Linear Quadrilateral

    55 Plane Strain Parabolic Quadrilateral

    56 Plane Strain Cubic Quadrilateral

    61 Plate Linear Triangle

    62 Plate Parabolic Triangle

    63 Plate Cubic Triangle

    64 Plate Linear Quadrilateral

    65 Plate Parabolic Quadrilateral

    66 Plate Cubic Quadrilateral

    71 Membrane Linear Quadrilateral

    72 Membrane Parabolic Triangle

    73 Membrane Cubic Triangle

    74 Membrane Linear Triangle

    75 Membrane Parabolic Quadrilateral

    76 Membrane Cubic Quadrilateral

    81 Axisymetric Solid Linear Triangle

    82 Axisymetric Solid Parabolic Triangle

    84 Axisymetric Solid Linear Quadrilateral

    85 Axisymetric Solid Parabolic Quadrilateral

    91 Thin Shell Linear Triangle

    92 Thin Shell Parabolic Triangle

    93 Thin Shell Cubic Triangle

    94 Thin Shell Linear Quadrilateral

    95 Thin Shell Parabolic Quadrilateral

    96 Thin Shell Cubic Quadrilateral

    101 Thick Shell Linear Wedge

    102 Thick Shell Parabolic Wedge

    103 Thick Shell Cubic Wedge

    104 Thick Shell Linear Brick

    105 Thick Shell Parabolic Brick

    106 Thick Shell Cubic Brick

    111 Solid Linear Tetrahedron

    112 Solid Linear Wedge

    113 Solid Parabolic Wedge

    114 Solid Cubic Wedge

    115 Solid Linear Brick

    116 Solid Parabolic Brick

    117 Solid Cubic Brick

    118 Solid Parabolic Tetrahedron

    121 Rigid Bar

    122 Rigid Element

    136 Node To Node Translational Spring

    137 Node To Node Rotational Spring

    138 Node To Ground Translational Spring

    139 Node To Ground Rotational Spring

    141 Node To Node Damper

    142 Node To Ground Damper

    151 Node To Node Gap

    152 Node To Ground Gap

    161 Lumped Mass

    171 Axisymetric Linear Shell

    172 Axisymetric Parabolic Shell

    181 Constraint

    191 Plastic Cold Runner

    192 Plastic Hot Runner

    193 Plastic Water Line

    194 Plastic Fountain

    195 Plastic Baffle

    196 Plastic Rod Heater

    201 Linear node-to-node interface

    202 Linear edge-to-edge interface

    203 Parabolic edge-to-edge interface

    204 Linear face-to-face interface

    208 Parabolic face-to-face interface

    212 Linear axisymmetric interface

    213 Parabolic axisymmetric interface

    221 Linear rigid surface

    222 Parabolic rigin surface

    231 Axisymmetric linear rigid surface

    232 Axisymmetric parabolic rigid surface
"""
function parse_dataset2412(block)

    elements_ID = Int[]
    fe_descriptor_id = Int[]
    phys_property = Int[]
    mat_property = Int[]
    color = Int[]
    nodes_per_elt = Int[]
    connectivity = Vector{Int}[]
    beam_info = Vector{Int}[]

    i = 2  # Start reading from line 2 (after dataset type)
    nlines = length(block)
    nodes_elt = Int[]
    while i ≤ nlines
        # Read Record 1
        elt, fed, pprop, mprop, col, nnode = parse.(Int, split(block[i]))
        push!(elements_ID, elt)
        push!(fe_descriptor_id, fed)
        push!(phys_property, pprop)
        push!(mat_property, mprop)
        push!(color, col)
        push!(nodes_per_elt, nnode)

        if fed in [11, 21, 22, 23, 24]  # Beam elements
            # Read Record 2 (beam info)
            i += 1
            push!(beam_info, parse.(Int, split(block[i])))

            # Read Record 3 (connectivity)
            i += 1
            push!(connectivity, parse.(Int, split(block[i])))
        else  # Non-beam elements
            # Read Record 2 (connectivity)
            npe = 0
            while npe < nnode
                i += 1
                r2 = parse.(Int, split(block[i]))
                append!(nodes_elt, r2)
                npe += length(r2)
            end

            push!(connectivity, copy(nodes_elt))
            empty!(nodes_elt)
        end

        i += 1
    end

    return Dataset2412(
        elements_ID,
        fe_descriptor_id,
        phys_property,
        mat_property,
        color,
        nodes_per_elt,
        connectivity,
        beam_info
    )
end

function write_dataset2412(dataset::Dataset2412)
    # Function implementation goes here
end
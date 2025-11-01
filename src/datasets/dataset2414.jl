"""
Universal Dataset Number: 2414

**Name:   Analysis Data**

    Record 1: FORMAT(1I10)
            Field 1            -- Analysis dataset label

    Record 2: FORMAT(40A2)
                 Field 1       -- Analysis dataset name

    Record 3: FORMAT (1I10)
                 Field 1:      -- Dataset location
                        1:    Data at nodes
                        2:    Data on elements
                        3:    Data at nodes on elements
                        5:    Data at points

    Record 4: FORMAT (40A2)
                 Field 1:      -- ID line 1

    Record 5: FORMAT (40A2)
                 Field 1:      -- ID line 2

    Record 6: FORMAT (40A2)
                 Field 1:      -- ID line 3

    Record 7: FORMAT (40A2)
                 Field 1:      -- ID line 4

    Record 8: FORMAT (40A2)
                 Field 1:      -- ID line 5

    Record 9: FORMAT (6I10)
                 Field 1:      -- Model type
                                   0: Unknown
                                   1: Structural
                                   2: Heat transfer
                                   3: Fluid flow
                 Field 2:      -- Analysis type
                                   0: Unknown
                                   1: Static
                                   2: Normal mode
                                   3: Complex eigenvalue first order
                                   4: Transient
                                   5: Frequency response
                                   6: Buckling
                                   7: Complex eigenvalue second order
                                   9: Static non-linear
                 Field 3:      -- Data characteristic
                                   0: Unknown
                                   1: Scalar
                                   2: 3 DOF global translation vector
                                   3: 6 DOF global translation & rotation
                                      vector
                                   4: Symmetric global tensor
                                   6: Stress resultants
                 Field 4:      -- Result type
                                   2: Stress
                                   3: Strain
                                   4: Element force
                                   5: Temperature
                                   6: Heat flux
                                   7: Strain energy
                                   8: Displacement
                                   9: Reaction force
                                   10: Kinetic energy
                                   11: Velocity
                                   12: Acceleration
                                   13: Strain energy density
                                   14: Kinetic energy density
                                   15: Hydro-static pressure
                                   16: Heat gradient
                                   17: Code checking value
                                   18: Coefficient of pressure
                                   19: Ply stress
                                   20: Ply strain
                                   21: Failure index for ply
                                   22: Failure index for bonding
                                   23: Reaction heat flow
                                   24: Stress error density
                                   25: Stress variation
                                   27: Shell and plate elem stress resultant
                                   28: Length
                                   29: Area
                                   30: Volume
                                   31: Mass
                                   32: Constraint forces
                                   34: Plastic strain
                                   35: Creep strain
                                   36: Strain energy error
                                   37: Dynamic stress at nodes
                                   38: Heat Transfer coefficient
                                   39: Temperature gradient
                                   40: Kinetic energy dissipation rate
                                   41: Strain energy error
                                   42: Mass flow
                                   43: Mass flux
                                   44: Heat flow
                                   45: View factor
                                   46: Heat load
                                   47: Stress Component
                                   93: Unknown
                                   94: Unknown scalar
                                   95: Unknown 3DOF vector
                                   96: Unknown 6DOF vector
                                   97: Unknown symmetric tensor
                                   98: Unknown global tensor
                                   99: Unknown shell and plate resultant
                                  301: Sound Pressure
                                  302: Sound Power
                                  303: Sound Intensity
                                  304: Sound Energy
                                  305: Sound Energy Density
                                >1000: User defined result type
                 Field 5:      -- Data type
                                   1:   Integer
                                   2:   Single precision floating point
                                   4:   Double precision floating point
                                   5:   Single precision complex
                                   6:   Double precision complex
                 Field 6:      -- Number of data values for the data
                                  component (NVALDC)

    Record 10: FORMAT (8I10)
                 Field 1:      -- Integer analysis type specific data (1-8)

    Record 11: FORMAT (8I10)
                 Field 1:      -- Integer analysis type specific data (9,10)

    Record 12: FORMAT (6E13.5)
                 Field 1:      -- Real analysis type specific data (1-6)

    Record 13: FORMAT (6E13.5)
                 Field 1:      -- Real analysis type specific data (7-12)

    Note: See chart below for specific analysis type information.

    Dataset class: Data at nodes

    Record 14: FORMAT (I10)
                 Field 1:      -- Node number

    Record 15: FORMAT (6E13.5)
                 Fields 1-N:   -- Data at this node (NDVAL real or complex
                                                     values)

                 Note: Records 14 and 15 are repeated for each node.

    Dataset class: Data at elements

    Record 14: FORMAT (2I10)
                 Field 1:      -- Element number
                 Field 2:      -- Number Of data values For this element(NDVAL)

    Record 15: FORMAT (6E13.5)
                 Fields 1-N:   -- Data on element(NDVAL Real Or Complex Values)

                 Note: Records 14 and 15 are repeated for all elements.

    Dataset class: Data at nodes on elements

    RECORD 14: FORMAT (4I10)
                 Field 1:      -- Element number
                 Field 2:      -- Data expansion code (IEXP)
                                  1: Data present for all nodes
                                  2: Data present for only 1st node -All other
                                     nodes the same.
                 Field 3:      -- Number of nodes on elements (NLOCS)
                 Field 4:      -- Number of data values per node (NVLOC)

    RECORD 15: FORMAT (6E13.5)

                 Fields 1-N:   -- Data Values At Node 1 (NVLOC Real Or
                                  Complex Values)

                 Note:  Records 14 And 15 Are repeated For each Element.

                        For Iexp = 1 Record 15 Is repeated NLOCS Times
                        For Iexp = 2 Record 15 appears once

    Dataset class: Data at points

    RECORD 14: FORMAT (5I10)
                 Field 1:      -- Element number
                 Field 2:      -- Data expansion code (IEXP)
                                  1: Data present for all points
                                  2: Data present for only 1st point -All other
                                     points the same.
                 Field 3:      -- Number of points on elements (NLOCS)
                 Field 4:      -- Number of data values per point (NVLOC)
                 Field 5:      -- Element order

    RECORD 15: FORMAT (6E13.5)

                 Fields 1-N:   -- Data Values At point 1 (NVLOC Real Or
                                  Complex Values)

                 Note:  Records 14 And 15 Are repeated For each Element.

                        For Iexp = 1 Record 15 Is repeated NLOC Times
                        For Iexp = 2 Record 15 appears once

          Notes:   1.  ID lines may not be blank.  If no information
                       is required, the word "NONE" must appear in
                       columns 1-4.

                   2.  The data is store in
                       "node-layer-data charateristic" format.

                        Loc1 layer1 component1, Loc1 layer1 component2, ...
                        Loc1 layer1 componentN, Loc1 layer2 component1, ...
                        Loc1 Layer2 componentN, ...Loc1 layerN componentN
                        Loc2 layer1 component1, ...Loc2 layerN componentN
                        LocN layer1 component1, ...LocN layerN componentN

                   3.  For complex data there Will Be 2*NDVAL data items. The
                       order is real part for value 1, imaginary part for
                       value 1, real part for value 2, imaginary part for
                       value 2, etc.

                   4.  The order of values for various data
                       characteristics is:

                       3 DOF Global Vector: X, Y, Z
                       6 DOF Global Vector: X, Y, Z, Rx, Ry, Rz
                       Symmetric Global Tensor: Sxx, Sxy, Syy,
                                                Sxz, Syz, Szz

                       Shell and Plate Element Resultant: Fx, Fy, Fxy,
                                                          Mx, My, Mxy,
                                                          Vx, Vy

                   5.  ID line 1 always appears on plots in output
                       display.

                   6.  If result type is an "UNKNOWN" type,  id line 2
                       is displayed as data type in output display.

                   7.  Data Characteristic values (Record 9, Field 3)
                       imply the following values Of NDVALDC (Record 9,
                       Field 6)
                             Scalar:                   1
                             3 DOF Global Vector:      3
                             6 DOF Global Vector:      6
                             Symmetric Global Tensor:  6
                             General Global Tensor:    9
                             Shell and Plate Resultant:8
                       Since this value can also be derived from the Results
                       Type (Record 9, Field 4), this is redundant data, and
                       should be kept consistent. Some data was kept for
                       compatibility with older files.

                   8.  No entry is NOT the same as a 0. entry: all 0s must
                       be specified.

                   9.  A direct result of 8 is that if no records 14 and
                       15 appear for a node or element, this entity has
                       no data and will not be contoured, etc.

                   10. Dataloaders use the following id line convention:

                        1.   (80A1) MODEL IDENTIFICATION
                        2.   (80A1) RUN IDENTIFICATION
                        3.   (80A1) RUN DATE/TIME
                        4.   (80A1) LOAD CASE NAME
                        For static:

                        5.   (17H LOAD CASE NUMBER;, I10)

                        For normal mode:

                        5.   (10H MODE SAME, I10, 10H FREQUENCY, E13.5)

                   11. For situations with reduced # DOF'S, use 6 DOF
                       translation and rotation with unused values = 0.

                   12. The integer associated data "number retained" will
                       =0 unless the result set is created by sorting for
                       extremes.  The maximum number of values to retain is 6.

        Specifed values:
          NDVAL  - Number of data values for the element.
          NLOCS  - Number of location on the element data is stored for.
           NVALDC - Number of values for the data component.

        Derived values:
          NLAY   - Number of location through the thickness data is stored for
                 =  NDVAL / ( NLOCS * NDVALC)
          NVLOC  - Number of values per location.
                 =  NLAY * NVALDC

        The following is always true:
        NDVAL =  NLOCS * NLAY * NVALDC

                        Dataset class: Data at nodes

                   1.  NLOCS = 1
                       NLAY  = 1

                       NDVAL = NVALDC

                   2.  Typical fortran I/O statements for the data
                       sections are:

                             READ(LUN,1000)NUM
                             WRITE
                        1000 FORMAT (I10)
                             READ(LUN,1010) (VAL(I),I=1,NDVAL)
                             WRITE
                        1010 FORMAT (6E13.5)

                             Where: VAL is real or complex data array
                                    NUM is element number

    Dataset class: Data at elements

                   1.  Data on 2D type elements may have multiple values
                       through the element thickness.  In these cases:
                           NLOCS =1
                               NLAY  =Number of layers of data through the
                                      thickness.

                         NDVAL = NLAY * NVALDC

                       For solid elements:
                         NLOCS = 1
                               NLAY  = 1

                         NDVAL = NVALDC

                       The order of the nodes defines an outward normal which
                       specifies the order from position 1 to NPOS.

                   2.  Maximum Value For NVALDC Is 9.
                       No Maximum Value For NDVAL.
                       No Maximum Value For NLAY.

                   3.  Typical fortran I/O statements for the data
                       sections are:
                             READ (LUN, 1000) NUM, NDVAL
                             WRITE
                        1000 FORMAT (2I10)
                             READ (LUN, 1010) (VAL(I),I=1,NDVAL)
                             WRITE
                        1010 FORMAT (6E13.5)

                             Where:  VAL is real or complex data array
                                     NUM is element number

    Dataset class: Data at nodes on elements

                   1.  Data on 2D type elements may have multiple values
                       through the element thickness.  In these cases:
                           NLOCS =Number of nodes for the element.
                               NLAY  =Number of layers of data through the
                                      thickness.

                         NDVAL = NLOCS * NLAY * NVALDC

                       For solid elements:
                         NLOCS = Number of nodes for the element.
                               NLAY  = 1

                         NDVAL = NLOCS * NVALDC

                       The order of the nodes defines an outward normal which
                       specifies the order from position 1 to NPOS.

                   2.  Maximum Value For NVALDC Is 9.
                       No Maximum Value For NDVAL.
                       No Maximum Value For NLAY.

                   3.  Typical Fortran I/O statements for the data sections
                       are:

                             READ (LUN,1000) NUM, IEXP, NLOCS, NVLOC
                             WRITE
                        1000 FORMAT (4I10)
                       C
                       C       Process Expansion Code 1
                       C
                             IF (IEXP.NE.1) GO TO 20
                             NSTRT = 1
                             DO 10 I=1, NLOCS
                               NSTOP = NSTRT + NVLOC - 1
                               READ (LUN,1010) (VAL(J),J=NSTRT,STOP)
                               WRITE
                        1010   FORMAT (6E13.5)
                               NSTRT = NSTRT + NVLOC
                        10   CONTINUE
                             GO TO 50
                       C
                       C       PROCESS EXPANSION CODE 2
                       C
                        20   READ (LUN,1010) (VAL(I),I=1,NVLOC)
                             NOFF = 0
                             DO 40 I=1,NLOCS
                               NOFF = NOFF +NVLOC
                               DO 30 J=1, NVLOC
                                 VAL (NOFF+J) = VAL(J)
                        30     CONTINUE
                        40   CONTINUE
                       C
                        50   NDVAL = NVLOC*NLOCS

                             Where:    NUM is element number.
                                       IEXP is the element expansion code
                                       VAL is real or complex data array.

    Dataset class: Data at points

                   1.  Only Tetrahedral elements will be supported.

                   2.  For solid elements:
                         NLOCS = Number of points on the element data is stored
                                 for.  Determined from the element type and
                                 order.
                               NLAY  = 1

                         NDVAL = NLOCS * NVALDC

                   3.  Maximum Value For NVALDC Is 9.
                       No Maximum Value For NDVAL.

                   4.  The element order is equal to the P-order of the element

                   5.  The number of points per element is calculated from
                       the element order as follows:

                         Number_of_Points = sum(i= 1 to P-Order+1)
                                           [sum(j = 1 to i)[1 + i - j) )]]

                   6.  Typical Fortran I/O statements for the data sections
                       are:

                             READ (LUN,1000) NUM, IEXP, NLOCS, NVLOC, IORDER
                             WRITE
                        1000 FORMAT (4I10)
                                          .
                                          .
                                          .
                           (See 3. for Data at Nodes on Elements)

                                       Analysis Type
                                                                              S
                                                                               t
                                                                               a
                                                  C                       C    t
                                                  o           F           o    i
                                            N     m           r           m    c
                                            o     p           e           p
                                            r     l           q           l    N
                                            m     e     T                 e    o
                                            a     x     r     R     B     x    n
                                U           l           a     e     u
                                n     S           E     n     s     c     E    L
                                k     t     M     i     s     p     k     i    i
                                n     a     o     g     i     o     l     g    n
                                o     t     d     e     e     n     i     e    e
                                w     i     e     n     n     s     n     n    a
                                n     c     s     1     t     e     g     2    r

           Design set ID        X     X     X     X     X     X     X     X    X

           Iteration number           X     X

           Solution set ID      X     X     X     X     X     X     X     X    X
    I
    N      Boundary condition   X     X     X     X     X     X     X     X    X
    T
    E      Load set                   X           X     X     X     X     X
    G
    E      Mode number                      X     X                 X     X
    R
           Time step number                             X                      X

           Frequency number                                   X

           Creation option      X     X     X     X     X     X     X     X    X

           Number retained      X     X     X     X     X     X     X     X    X


-----------------------------------------------------------------------

           Time                                         X                      X

           Frequency                        X                 X

           Eigenvalue                                               X

           Modal Mass                       X

           Viscous damping                  X

           Hysteretic damping               X

     R     Real part eigenvalue                   X                       X
     E
     A     Imaginary part eingenvalue             X                       X
     L
           Real part of modal A                   X
           Real part of mass                                              X

           Imaginary part of modal A              X
           Imaginary part of mass                                         X

           Real part of modal B                   X
           Real part of stiffness                                         X

           Imaginary part of modal B              X
           Imaginary part of stiffness                                    X
----------------------------------------------------------------------
"""
function parse_dataset2414(block)
    nlines = length(block)

    analysis_dlabel = parse(Int, strip(block[2]))
    analysis_dname = strip(block[3])
    dataset_location = parse(Int, strip(block[4]))
    id_line1 = strip(block[5])
    id_line2 = strip(block[6])
    id_line3 = strip(block[7])
    id_line4 = strip(block[8])
    id_line5 = strip(block[9])

    # Record 9 fields
    model_type, analysis_type, data_characteristic, result_type, dtype, num_data_values = parse.(Int, split(strip(block[10])))

    # Record 10-11 fields
    int_analysis_type_raw = Int[]
    append!(int_analysis_type_raw, parse.(Int, split(strip(block[11]))))
    append!(int_analysis_type_raw, parse.(Int, split(strip(block[12]))))

    # Record 12-13 fields
    real_analysis_type_raw = Float64[]
    append!(real_analysis_type_raw, parse.(Float64, split(strip(block[13]))))
    append!(real_analysis_type_raw, parse.(Float64, split(strip(block[14]))))

    # record 14_15 fields
    data_info_raw = Vector{Int}[]
    data_value_raw, ndv, data_type = if dtype == 1
        Vector{Int}[], num_data_values, Int
    elseif dtype == 2
        Vector{Float32}[], num_data_values, Float32
    elseif dtype == 4
        Vector{Float64}[], num_data_values, Float64
    elseif dtype == 5
        Vector{ComplexF32}[], 2num_data_values, Float32
    elseif dtype == 6
        Vector{ComplexF64}[], 2num_data_values, Float64
    end

    i = 15
    data_exp = 1
    total_vals = ndv
    _values = similar(eltype(data_value_raw), 0)
    while i < nlines
        # Record 14
        push!(data_info_raw, parse.(Int, split(strip(block[i]))))

        if dataset_location == 3 || dataset_location == 5
            data_exp = data_info_raw[end][2]
            nnodes = data_info_raw[end][3]
            nval_per_nodes = data_info_raw[end][4]

            if data_exp == 1
                total_vals = nnodes*nval_per_nodes
            else
                total_vals = nval_per_nodes
            end
        end

        # Record 15
        np = 0
        while np < total_vals
            i += 1
            r15 = parse.(data_type, split(strip(block[i])))
            np += length(r15)

            # Repeat values if necessary
            if data_exp == 2
                r15 = repeat(r15, nnodes)
            end

            if dtype < 5
                append!(_values, r15)
            else
                append!(_values, complex.(r15[1:2:end], r15[2:2:end]))
            end
        end

        push!(data_value_raw, copy(_values))
        empty!(_values)
        i += 1
    end

    return Dataset2414(
        analysis_dlabel,
        analysis_dname,
        dataset_location,
        id_line1,
        id_line2,
        id_line3,
        id_line4,
        id_line5,
        model_type,
        analysis_type,
        data_characteristic,
        result_type,
        dtype,
        num_data_values,
        int_analysis_type_raw,
        real_analysis_type_raw,
        data_info_raw,
        data_value_raw
    )
end

function write_dataset2414(dataset::Dataset2414)
    # Follow the docstring format for UFF 2414 (Analysis Data)
    lines = String[]

    # Header
    push!(lines, "    -1")
    push!(lines, "  2414")

    # Record 1: Analysis dataset label (FORMAT 1I10)
    push!(lines, @sprintf("%10d", dataset.analysis_dlabel))

    # Record 2: Analysis dataset name (FORMAT 40A2)
    push!(lines, dataset.analysis_dname)

    # Record 3: Dataset location (FORMAT 1I10)
    push!(lines, @sprintf("%10d", dataset.dataset_location))

    # Records 4-8: ID lines (FORMAT 40A2 each)
    push!(lines, dataset.id_line1)
    push!(lines, dataset.id_line2)
    push!(lines, dataset.id_line3)
    push!(lines, dataset.id_line4)
    push!(lines, dataset.id_line5)

    # Record 9: Six integer fields (FORMAT 6I10)
    push!(
        lines,
        @sprintf("%10d%10d%10d%10d%10d%10d",
            dataset.model_type,
            dataset.analysis_type,
            dataset.data_characteristic,
            dataset.result_type,
            dataset.dtype,
            dataset.num_data_values
        )
    )

    # Get raw integer analysis type data (expand NamedTuple back to array)
    int_raw = zeros(Int, 10)
    for (key, value) in pairs(dataset.int_analysis_type)
        if key == :design_set_ID
            int_raw[1] = value
        elseif key == :iteration_ID
            int_raw[2] = value
        elseif key == :solution_set_ID
            int_raw[3] = value
        elseif key == :bc
            int_raw[4] = value
        elseif key == :load_set
            int_raw[5] = value
        elseif key == :mode_ID
            int_raw[6] = value
        elseif key == :time_step_ID
            int_raw[7] = value
        elseif key == :freq_step_ID
            int_raw[8] = value
        elseif key == :creation_option
            int_raw[9] = value
        elseif key == :number_retained
            int_raw[10] = value
        end
    end

    # Record 10: First 8 integer analysis type specific data (FORMAT 8I10)
    push!(
        lines,
        @sprintf("%10d%10d%10d%10d%10d%10d%10d%10d",
            int_raw[1], int_raw[2], int_raw[3], int_raw[4],
            int_raw[5], int_raw[6], int_raw[7], int_raw[8]
        )
    )

    # Record 11: Last 2 integer analysis type specific data (FORMAT 8I10, but only 2 used)
    push!(
        lines,
        @sprintf("%10d%10d",
            int_raw[9], int_raw[10]
        )
    )

    # Get raw real analysis type data (expand NamedTuple back to array)
    real_raw = zeros(Float64, 12)
    for (key, value) in pairs(dataset.real_analysis_type)
        if key == :time
            real_raw[1] = value
        elseif key == :frequency
            real_raw[2] = value
        elseif key == :eigenvalue
            real_raw[3] = value
        elseif key == :modal_mass
            real_raw[4] = value
        elseif key == :modal_visc_dr
            real_raw[5] = value
        elseif key == :modal_hyst_dr
            real_raw[6] = value
        elseif key == :real_eigenvalue
            real_raw[7] = value
        elseif key == :imag_eigenvalue
            real_raw[8] = value
        elseif key == :real_modalA
            real_raw[9] = value
        elseif key == :imag_modalA
            real_raw[10] = value
        elseif key == :real_modalB
            real_raw[11] = value
        elseif key == :imag_modalB
            real_raw[12] = value
        end
    end

    # Record 12: First 6 real analysis type specific data (FORMAT 6E13.5)
    push!(
        lines,
        @sprintf("  %.5E  %.5E  %.5E  %.5E  %.5E  %.5E",
            real_raw[1], real_raw[2], real_raw[3],
            real_raw[4], real_raw[5], real_raw[6]
        )
    )

    # Record 13: Last 6 real analysis type specific data (FORMAT 6E13.5)
    push!(
        lines,
        @sprintf("  %.5E  %.5E  %.5E  %.5E  %.5E  %.5E",
            real_raw[7], real_raw[8], real_raw[9],
            real_raw[10], real_raw[11], real_raw[12]
        )
    )

    # Records 14-15: Data records depend on dataset_location
    if dataset.dataset_location == 1
        # Data at nodes
        for i in 1:length(dataset.data_info.node_ID)
            # Record 14: Node number (FORMAT I10)
            push!(lines, @sprintf("%10d", dataset.data_info.node_ID[i]))

            # Record 15: Data values (FORMAT 6E13.5)
            # Get data for this node
            data_vals = if dataset.dtype < 5
                # Real or integer data
                vec(dataset.data_value[i, :])
            else
                # Complex data: interleave real and imaginary parts
                vals = Float64[]
                for val in dataset.data_value[i, :]
                    push!(vals, real(val))
                    push!(vals, imag(val))
                end
                vals
            end

            # Write data values, 6 per line
            for j in 1:6:length(data_vals)
                end_idx = min(j + 5, length(data_vals))
                line_vals = data_vals[j:end_idx]

                # Format based on data type - FORMAT 6E13.5
                parts = [@sprintf("%13.5E", Float64(val)) for val in line_vals]
                push!(lines, join(parts, ""))
            end
        end

    elseif dataset.dataset_location == 2
        # Data on elements
        for i in 1:length(dataset.data_info.elt_ID)
            # Record 14: Element number, Number of data values (FORMAT 2I10)
            ndv = length(dataset.data_value[i])
            push!(lines, @sprintf("%10d%10d", dataset.data_info.elt_ID[i], ndv))

            # Record 15: Data values (FORMAT 6E13.5)
            data_vals = if dataset.dtype < 5
                # Real or integer data
                dataset.data_value[i]
            else
                # Complex data: interleave real and imaginary parts
                vals = Float64[]
                for val in dataset.data_value[i]
                    push!(vals, real(val))
                    push!(vals, imag(val))
                end
                vals
            end

            # Write data values, 6 per line
            for j in 1:6:length(data_vals)
                end_idx = min(j + 5, length(data_vals))
                line_vals = data_vals[j:end_idx]

                # Format based on data type - FORMAT 6E13.5
                parts = [@sprintf("%13.5E", Float64(val)) for val in line_vals]
                push!(lines, join(parts, ""))
            end
        end

    elseif dataset.dataset_location == 3
        # Data at nodes on elements
        for i in 1:length(dataset.data_info.elt_ID)
            # Record 14: Element number, Data expansion code, Number of nodes, Number of values per node (FORMAT 4I10)
            push!(
                lines,
                @sprintf("%10d%10d%10d%10d",
                    dataset.data_info.elt_ID[i],
                    dataset.data_info.data_exp_code[i],
                    dataset.data_info.nnodes_per_elt[i],
                    dataset.data_info.ndv_per_node[i]
                )
            )

            # Record 15: Data values (FORMAT 6E13.5)
            # Handle expansion code: 1 = all nodes, 2 = only first node (all others same)
            data_matrix = dataset.data_value[i]
            exp_code = dataset.data_info.data_exp_code[i]

            # Select which rows to write based on expansion code
            rows_to_write = if exp_code == 1
                # Write all nodes
                1:size(data_matrix, 1)
            else  # exp_code == 2
                # Write only first node (all others are identical)
                1:1
            end

            data_vals = if dataset.dtype < 5
                # Real or integer data
                # Flatten selected rows row by row
                vec(transpose(data_matrix[rows_to_write, :]))
            else
                # Complex data: interleave real and imaginary parts
                vals = Float64[]
                for val in transpose(data_matrix[rows_to_write, :])
                    push!(vals, real(val))
                    push!(vals, imag(val))
                end
                vals
            end

            # Write data values, 6 per line
            for j in 1:6:length(data_vals)
                end_idx = min(j + 5, length(data_vals))
                line_vals = data_vals[j:end_idx]

                # Format based on data type - FORMAT 6E13.5
                parts = [@sprintf("%13.5E", Float64(val)) for val in line_vals]
                push!(lines, join(parts, ""))
            end
        end

    elseif dataset.dataset_location == 5
        # Data at points
        for i in 1:length(dataset.data_info.elt_ID)
            # Record 14: Element number, Data expansion code, Number of points, Number of values per point, Element order (FORMAT 5I10)
            push!(
                lines,
                @sprintf("%10d%10d%10d%10d%10d",
                    dataset.data_info.elt_ID[i],
                    dataset.data_info.data_exp_code[i],
                    dataset.data_info.npts_per_elt[i],
                    dataset.data_info.ndv_per_point[i],
                    dataset.data_info.elt_order[i]
                )
            )

            # Record 15: Data values (FORMAT 6E13.5)
            # Handle expansion code: 1 = all points, 2 = only first point (all others same)
            data_matrix = dataset.data_value[i]
            exp_code = dataset.data_info.data_exp_code[i]

            # Select which rows to write based on expansion code
            rows_to_write = if exp_code == 1
                # Write all points
                1:size(data_matrix, 1)
            else  # exp_code == 2
                # Write only first point (all others are identical)
                1:1
            end

            data_vals = if dataset.dtype < 5
                # Real or integer data
                # Flatten selected rows row by row
                vec(transpose(data_matrix[rows_to_write, :]))
            else
                # Complex data: interleave real and imaginary parts
                vals = Float64[]
                for val in transpose(data_matrix[rows_to_write, :])
                    push!(vals, real(val))
                    push!(vals, imag(val))
                end
                vals
            end

            # Write data values, 6 per line
            for j in 1:6:length(data_vals)
                end_idx = min(j + 5, length(data_vals))
                line_vals = data_vals[j:end_idx]

                # Format based on data type - FORMAT 6E13.5
                parts = [@sprintf("%13.5E", Float64(val)) for val in line_vals]
                push!(lines, join(parts, ""))
            end
        end
    end

    # Footer
    push!(lines, "    -1")

    return lines
end
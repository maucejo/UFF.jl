"""
Universal Dataset Number: 164

Name:   Units
-----------------------------------------------------------------------

Record 1:       FORMAT(I10,20A1,I10)
                Field 1      -- units code
                                = 1 - SI: Meter (newton)
                                = 2 - BG: Foot (pound f)
                                = 3 - MG: Meter (kilogram f)
                                = 4 - BA: Foot (poundal)
                                = 5 - MM: mm (milli newton)
                                = 6 - CM: cm (centi newton)
                                = 7 - IN: Inch (pound f)
                                = 8 - GM: mm (kilogram f)
                                = 9 - US: USER_DEFINED
                Field 2      -- units description (used for
                                documentation only)
                Field 3      -- temperature mode
                                = 1 - absolute
                                = 2 - relative
Record 2:       FORMAT(3D25.17)
                Unit factors for converting universal file units to SI.
                To convert from universal file units to SI divide by
                the appropriate factor listed below.
                Field 1      -- length
                Field 2      -- force
                Field 3      -- temperature
                Field 4      -- temperature offset

-----------------------------------------------------------------------
"""
function parse_dataset164(block)
    record1 = extend_line(strip(block[2]))
    units = parse(Int, record1[1])
    description = strip(record1[2:29])
    temperature_mode = parse(Int, strip(record1[31:end]))

    conversion_factor = zeros(Float64, 4)
    conversion_factor[1:3] .= parse.(Float64, split(block[3]))
    conversion_factor[4] = parse(Float64, strip(block[4]))

    return Dataset164(
        units,
        description,
        temperature_mode,
        conversion_factor
    )
end

function write_dataset164(dataset::Dataset164)
    # Function implementation goes here
end
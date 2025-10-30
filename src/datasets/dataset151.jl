"""
Universal Dataset Number: 151

Name:   Header
-----------------------------------------------------------------------

Record 1:       FORMAT(80A1)
                Field 1      -- model file name
Record 2:       FORMAT(80A1)
                Field 1      -- model file description
Record 3:       FORMAT(80A1)
                Field 1      -- program which created DB
Record 4:       FORMAT(10A1,10A1,3I10)
                Field 1      -- date database created (DD-MMM-YY)
                Field 2      -- time database created (HH:MM:SS)
                Field 3      -- Version from database
                Field 4      -- Version from database
                Field 5      -- File type
                                =0  Universal
                                =1  Archive
                                =2  Other
Record 5:       FORMAT(10A1,10A1)
                Field 1      -- date database last saved (DD-MMM-YY)
                Field 2      -- time database last saved (HH:MM:SS)
Record 6:       FORMAT(80A1)
                Field 1      -- program which created universal file
Record 7:       FORMAT(10A1,10A1)
                Field 1      -- date universal file written (DD-MMM-YY)
                Field 2      -- time universal file written (HH:MM:SS)

----------------------------------------------------------------------------
"""
function parse_dataset151(block)
    model_name = strip(block[2])
    description = strip(block[3])
    application = strip(block[4])

    # Record 4 contains multiple fields in one line
    line_creation = extend_line(strip(block[5]))
    datetime_created = strip(line_creation[1:20])
    version = strip(line_creation[21:40])
    if isempty(strip(line_creation[41:end]))
        file_type = 0
    else
        file_type = parse(Int, strip(line_creation[41:end]))
    end

    datetime_last_saved = strip(block[6])
    program = strip(block[7])
    datetime_written = strip(block[8])

    return Dataset151(
        model_name,
        description,
        application,
        datetime_created,
        version,
        file_type,
        datetime_last_saved,
        program,
        datetime_written
    )
end

function write_dataset151(dataset::Dataset151)
    # Function implementation goes here
end
abstract type UFFDataset end

# Types for UFF datasets -- see https://www.ceas3.uc.edu/sdrluff/

# Types of UFF datasets
struct Dataset15 <: UFFDataset
    # Fields specific to Dataset15
end

struct Dataset18 <: UFFDataset
    # Fields specific to Dataset18
end

struct Dataset55 <: UFFDataset
    # Fields specific to Dataset55
end

struct Dataset58 <: UFFDataset
    # Fields specific to Dataset58
end

struct Dataset58b <: UFFDataset
    # Fields specific to Dataset58b
end

struct Dataset82 <: UFFDataset
    # Fields specific to Dataset82
end

struct Dataset151 <: UFFDataset
    # Fields specific to Dataset151
end

struct Dataset164 <: UFFDataset
    # Fields specific to Dataset164
end

struct Dataset259 <: UFFDataset
    # Fields specific to Dataset259
end

struct Dataset781 <: UFFDataset
    # Fields specific to Dataset781
end

struct Dataset1858 <: UFFDataset
    # Fields specific to Dataset1858
end

struct Dataset2411 <: UFFDataset
    # Fields specific to Dataset2411
end

struct Dataset2414 <: UFFDataset
    # Fields specific to Dataset2414
end

## Functions for reading UFF datasets

"""
    parse_block(dtype::String, block::Vector{String}) -> UFFDataset

Parses a block of UFF data based on the dataset type.

**Input**
- `dtype::String`: The dataset type identifier (e.g., "15", "18", etc.).
- `block::Vector{String}`: The block of data as a vector of strings.

**Output**
- `dataset::UFFDataset`: The parsed dataset as an instance of the corresponding UFFDataset subtype.
"""
function parse_block(dtype::String, block::Vector{String})
    if dtype == "15"
        # Parse Dataset15
        return parse_dataset15(block)
    elseif dtype == "18"
        # Parse Dataset18
        return parse_dataset18(block)
    elseif dtype == "55"
        # Parse Dataset55
        return parse_dataset55(block)
    elseif dtype == "58"
        # Parse Dataset58
        return parse_dataset58(block)
    elseif dtype == "58b"
        # Parse Dataset58b
        return parse_dataset58b(block)
    elseif dtype == "82"
        # Parse Dataset82
        return parse_dataset82(block)
    elseif dtype == "151"
        # Parse Dataset151
        return parse_dataset151(block)
    elseif dtype == "164"
        # Parse Dataset164
        return parse_dataset164(block)
    elseif dtype == "259"
        # Parse Dataset259
        return parse_dataset259(block)
    elseif dtype == "781"
        # Parse Dataset781
        return parse_dataset781(block)
    elseif dtype == "1858"
        # Parse Dataset1858
        return parse_dataset1858(block)
    elseif dtype == "2411"
        # Parse Dataset2411
        return parse_dataset2411(block)
    elseif dtype == "2414"
        # Parse Dataset2414
        return parse_dataset2414(block)
    else
        throw("Unsupported dataset type: $dtype")
    end
end
module UFF

    # Using necessary modules
    using FileIO

    # Exported Types
    export Dataset15, Dataset18, Dataset55, Dataset58, Dataset58b,
           Dataset82, Dataset151, Dataset164, Dataset259,
           Dataset781, Dataset1858, Dataset2411, Dataset2414

    # Exported Functions
    export readuff, writeuff

    # Include files
    include("uff_types.jl")
    include("uff_utils.jl")

    # Include datasets read/write functions
    include("read_write_uff.jl")
    include("dataset15.jl")
    include("dataset18.jl")
    include("dataset55.jl")
    include("dataset58.jl")
    include("dataset58b.jl")
    include("dataset82.jl")
    include("dataset151.jl")
    include("dataset164.jl")
    include("dataset259.jl")
    include("dataset781.jl")
    include("dataset1858.jl")
    include("dataset2411.jl")
    include("dataset2414.jl")
end

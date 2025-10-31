module UFFio
    using Printf

    # Exported Types
    export Dataset15, Dataset18, Dataset55, Dataset58, Dataset82,
           Dataset151, Dataset164, Dataset2411, Dataset2412, Dataset2414

    # Exported functions - Main functions
    export readuff, writeuff

    # Helper functions
    export connectivity_matrix, dataset_types, supported_datasets

    # Include files
    include("uff_utils.jl")
    include("uff_types.jl")
    include("uff_helpers.jl")

    # Include datasets read/write functions
    include("datasets/dataset15.jl")
    include("datasets/dataset18.jl")
    include("datasets/dataset55.jl")
    include("datasets/dataset58.jl")
    include("datasets/dataset82.jl")
    include("datasets/dataset151.jl")
    include("datasets/dataset164.jl")
    include("datasets/dataset2411.jl")
    include("datasets/dataset2412.jl")
    include("datasets/dataset2414.jl")
    include("read_write_uff.jl")
end

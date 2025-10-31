"""
    dataset_types(data::UFFDataset) -> Symbol

Returns the dataset type presents in a UFFDataset object.

**Input**
- `data::UFFDataset`: The UFFDataset object to extract types from.

**Output**
- `Symbol`: A vector containing the dataset types.
"""
function dataset_types(data::UFFDataset)
    # Function to get the types of UFF datasets in a vector
    return data.type
end

"""
    supported_datasets() -> Vector{Int}

Returns a vector of supported UFF dataset types.
"""
function supported_datasets()
    # Returns a vector of supported UFF dataset types
    return [15, 18, 55, 58, 82, 151, 164, 2411, 2412, 2414]
end

"""
    connectivity_matrix(dataset::Dataset2412) -> Matrix{Int}

Returns the connectivity matrix for a Dataset2412 object, where each row corresponds to an element and each column corresponds to a node. Missing values are filled with `-1`.

**Input**
- `dataset::Dataset2412`: The Dataset2412 object to extract connectivity from.

**Output**
- `Matrix{Int}`: A matrix representing the connectivity of elements to nodes.
"""
function connectivity_matrix(dataset::Dataset2412)
    # Create a mapping from element ID to its index in the dataset
    if dataset != Dataset2412
        throw(ArgumentError("connectivity_matrix function only supports Dataset2412 type."))
    end

    connectivity = dataset.connectivity
    max_nodes = maximum(length.(connectivity))

    mat = fill(-1, length(connectivity), max_nodes)
    for (i, conn) in enumerate(connectivity)
        mat[i, 1:length(conn)] .= conn
    end

    return mat
end
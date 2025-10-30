# UFF.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://maucejo.github.io/UFF.jl/)
[![Generic badge](https://img.shields.io/badge/Version-0.1.0-cornflowerblue.svg)]()
[![MIT License](https://img.shields.io/badge/License-MIT-forestgreen)](https://github.com/maucejo/elsearticle/blob/main/LICENSE)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)
[![DispatchDoctor](https://img.shields.io/badge/%F0%9F%A9%BA_tested_with-DispatchDoctor.jl-blue?labelColor=white)](https://github.com/MilesCranmer/DispatchDoctor.jl)

A Julia package for reading (and writing in the future) Universal File Format (UFF) files, commonly used in engineering applications.

> [!WARNING]
> The package is under active development and is developed as part of my research activities.

## Installation

Install `UFF.jl` via Julia's package manager:
```julia
import Pkg
Pkg.add("UFF")
```

or
```julia
(Yourenv) pkg> add UFF
```

## Documentation

To be added.

## Basic usage

```julia
using UFF

data = readuff("path/to/your/file.uff")
```

## Supported formats
Currently, `UFF.jl` supports reading UFF files with the following blocks:
- Dataset 15
- Dataset 55
- Dataset 58
- Dataset 82
- Dataset 151
- Dataset 164
- Dataset 2411
- Dataset 2412
- Dataset 2414

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

MIT licensed

Copyright (C) 2025 Mathieu AUCEJO (maucejo)
using ThieleTiles
using Documenter

DocMeta.setdocmeta!(ThieleTiles, :DocTestSetup, :(using ThieleTiles); recursive=true)

makedocs(;
    modules=[ThieleTiles],
    authors="Thomas Poulsen <ta.poulsen@gmail.com> and contributors",
    repo="https://github.com/tp2750/ThieleTiles.jl/blob/{commit}{path}#{line}",
    sitename="ThieleTiles.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://tp2750.github.io/ThieleTiles.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/tp2750/ThieleTiles.jl",
    devbranch="main",
)

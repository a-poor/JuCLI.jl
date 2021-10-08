using Test, JuCLI

@testset "JuCLI" begin


cli = CLI("mycli")

@test cli.name == "mycli"
@test CLI().name == "cli"

end # JuCLI

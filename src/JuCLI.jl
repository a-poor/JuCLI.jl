module JuCLI

export CLI, ActionContext, Flag, run


struct Flag{T}
    name::String
    usage::String
    optional::Bool
    default::Union{T,Nothing}
end

# ActionContext is passed to the action function.
# Note: The action function can modify this for 
# sub-commands. For example, calling `popfirst!`
# on `ActionContext.args` to pick the next action.
struct ActionContext
    args::Vector{String}
    flags::Vector{Flag}

    ActionContext(
        args::Vector{String}=Vector{String}(), 
        flags::Vector{Flag}=Vector{Flag}()
    ) = new(args, flags)
end

struct CLI 
    name::String
    usage::String
    flags::Vector{Flag}
    action::Function
    autohelp::Bool

    CLI(
        name="cli", 
        usage="", 
        flags=Vector{Flag}(), 
        action=() -> nothing,
        autohelp=true
    ) = new(name, usage, flags, action, autohelp)
end

# run the CLI with the supplied arguments.
# This is typically expected to be called with
# the `ARGS` data.
function run(cli::CLI, args::String[])
    ctx = parseargs(args)
end

# Create a new CLI context from the supplied arguments.
function parseargs(args::String[])::ActionContext

end

function formathelp(cli::CLI)::String
    """
    NAME:
        $(cli.name) - $(cli.usage)
    """
end

function displayhelp(cli::CLI)
    println(formathelp(cli))
end

# Check if the user 
function checkforhelp(args::String[])::Bool

end

end # module

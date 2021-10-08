module JuCLI

export CLI, ActionContext, Flag


struct Flag{T}
    name::String
    usage::String
    optional::Bool
    default::Union{T,Nothing}
end

struct ActionContext
    args::Vector{String}
    flags::Vector{Flag}
end

struct CLI 
    name::String
    usage::String
    flags::Vector{Flag}
    action::Function

    CLI(
        name="cli", 
        usage="", 
        flags=Vector{Flag}(), 
        action=() -> nothing
    ) = new(name, usage, flags, action)
end



end # module

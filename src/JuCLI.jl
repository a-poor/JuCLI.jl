module JuCLI

export greeting

greeting() = "Hello World!"


struct Flag

end

struct CLI 
    name::String
    usage::String
    flags::Vector{Flag}
    action::Function
end




end # module

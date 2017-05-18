module Crinja
  # Statement nodes return a value
  abstract class Statement
    getter token

    property parent : ParentStatement?

    alias Token = Lexer::Token

    def initialize(@token : Token = Token.new)
    end

    abstract def evaluate(env : Environment) : Type

    def value(env : Environment) : Value
      Value.new evaluate(env)
    end

    def root
      parent.not_nil!.root
    end

    def template
      root_node.try(&.template)
    end

    def root_node
      root.root_node
    end

    def inspect(io : IO, indent = 0)
      io << "<"
      to_s(io)
      inspect_arguments(io, indent)
      io << ">"

      inspect_children(io, indent + 1)

      io << "\n" << "  " * indent
      io << "</"
      io << {{ @type.stringify.split("::").last.downcase }}
      io << ">"
    end

    def inspect_arguments(io : IO, indent = 0)
    end

    def inspect_children(io : IO, indent = 0)
    end

    def to_s(io : IO)
      io << {{ @type.stringify }}.rpartition("::").last.downcase
      io << " token="
      token.inspect(io)
    end

    def raise(exc : RuntimeError)
      ::raise TemplateError.new(token, exc, template)
    end

    module ParentStatement
      abstract def <<(new_child : Statement)

      abstract def accepts_children? : Bool
    end
  end
end

require "./statement/*"
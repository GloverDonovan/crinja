class Crinja::Filter
  Crinja.filter({
    case_sensitive: false,
    by:             "key",
  }, :dictsort) do
    hash = target.as_h
    array = hash.to_a

    # case_sensitive = arguments[:case_sensitive].truthy?
    # if arguments[:by].to_s == "value"
    #  hash.to_a.sort do |(ak, av), (bk, bv)|
    #    Value.new(av) <=> Value.new(bv)
    #  end
    # else
    #  hash.to_a.sort do |(ak, av), (bk, kv)|
    #    Value.new(ak) <=> Value.new(bk)
    #  end
    # end.as(Array(Tuple(Crinja::Type, Crinja::Type))).map(&.to_a.as(Crinja::Type))
    # Bindings.cast_list(array)
    [] of Type
  end
end
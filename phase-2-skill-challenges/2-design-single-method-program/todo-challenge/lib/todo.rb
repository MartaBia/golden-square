def has_it(text)
    words = text.split(" ")
    if words.include?("TODO")
       return true
    else 
        return false
    end
end


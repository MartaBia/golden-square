def make_snippet(string)
  string_array = string.split(" ")

  if string_array.count >= 6
    string_five = []
    string_five.push(string_array[0..4])
    return "#{string_five.join(" ")}..."
  else
    return string
  end
end


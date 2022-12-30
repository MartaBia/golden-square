def postcode_checker(string)
  case string
  when /\w\w\d\w \d\w\w/, /\w\d\w \d\w\w/, /\w\d \d\w\w/
    return true
  else
    return false
  end
end

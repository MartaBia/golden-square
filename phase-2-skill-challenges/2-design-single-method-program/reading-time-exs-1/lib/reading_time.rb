def get_reading_time(text)
  words = text.split(" ")
  words.length

  if words.length < 200
    "reading time: less than a minute"
  elsif words.length == 200
    "reading time: about a minute"
  else
    "reading time: more than a minute"
  end
end


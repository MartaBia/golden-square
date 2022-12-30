Reading Time Method Design Recipe

1. Describe the Problem

The user wishes to manage their time more effectively, therefore wishes to have an estimate reading time for a piece of text, assuming that they can read 200 words a minute.

2. Design the Method Signature

```ruby
reading_time = calculate_reading_time(text)

# * text is a string with words in it
# * reading_time is an integer representing minutes

# text: a string
# reading_time =  word count / 200
# prints = integer + unit of time string (eg. 20 minutes)
# Side effect: convert floats to integers to get whole number of minutes. If reading time less than 60 seconds, print seconds, otherwise print minutes.
```

3. Create Examples as Tests
```ruby
# reading_time(string with 1000 words) => [5 "minutes"]
# reading_time("this is a test sentence") => [1.5 "seconds"]
# reading_time(nil) throws an error

# 1
calculate_reading_time("")
# => 0

# 2
calculate_reading_time("one")
# => 1

# 3
calculate_reading_time(TWO_HUNDRED_WORDS)
# => 1

# 4
calculate_reading_time(THREE_HUNDRED_WORDS)
# => 2

# 5
calculate_reading_time(FIVE_THOUSAND_WORDS)
# => 25
```
# Make a list of examples of what the method will take and return.

### EXAMPLE ###

extract_uppercase("hello WORLD") => ["WORLD"]
extract_uppercase("HELLO WORLD") => ["HELLO", "WORLD"]
extract_uppercase("hello world") => []
extract_uppercase("hello WoRLD") => []
extract_uppercase("hello WORLD!") => ["WORLD"]
extract_uppercase("") => []
extract_uppercase(nil) throws an error
Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour

# After each test you write, follow the test-driving process of red, green, refactor to # implement the behaviour.


Todo Method Design Recipe
1. Describe the Problem
as a user 
So that i can keep track of my tasks 
I want to check if a text includes the string #todo

2. Design the Method Signature
```ruby
check_for_todo = has_it(text)
```
check_for_todo : method that checks that a string includes a todo word
has_it : checks for the word
text: string 

 The method doesn't print anything or have any other side-effects

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

# EXAMPLE

* has_it("I have nothing to do") => false
* has_it("I have TODO everything!") => true


4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.


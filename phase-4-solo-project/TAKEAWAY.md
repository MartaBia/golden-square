# Takeaway Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

```ruby
class FormatTakeaway
  def initialise(takeaway)
  end

  def format #it formats the Takeaway class
  end
end

class Takeaway
  def initialize
    @menu = {} #is a hash containing all the dishes and their prices
    @current_order = {} # is a hash containing the dish the user wants  to order
  end
  
  def add_menu(dish) #dish is an instance of the class dish
    #it adds a dish to the menu hash
  end
  
  def menu #takes no argument and return the menu
  end

  def add_to_current_order #takes an integer as an input from the user and adds it to the current order
  end 
end

class Dish
  def initialize(name, price) #name is a strings representing
    #the name of the dish and price is a float representing the price
  end

  def name # returns the name of the dish
  end

  def price #returns the price of the dish
  end
end

class Text
end

```

## 3. Create Examples as Integration Tests

```ruby

takeaway = Takeaway.new
takeaway_formatter = Formatter.new(takeaway)
dish_1 = Dish.new("Mixed crostini and tuscan cured meat", 6)
dish_2 = Dish.new("Lasagne", 7)
dish_3 = Dish.new("Pumpkin and mushroom lasagne", 8)
dish_4 = Dish.new("Pumpkin risotto with gorgonzola", 8)
dish_5 = Dish.new("Paccheri with pecorino cheese cream and crispy pancetta", 7)
dish_6 = Dish.new("Tiramisu", 5)
dish_1.add_menu
dish_2.add_menu
dish_3.add_menu
dish_4.add_menu
dish_5.add_menu
dish_6.add_menu
expect(takeaway_formatter.format). to eq 

```

## 4. Create Examples as Unit Tests

```ruby
#Dish

dish_1 = Dish.new("Mixed crostini and tuscan cured meat", 6)
dish_2 = Dish.new("Lasagne", 7)
expect(dish_1.name).to eq "Mixed crostini and tuscan cured meat"
expect(dish_2.price).to eq 7

#Takeaway
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour.  
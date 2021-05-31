# Ruby Cheat Sheet:

## String Methods:
```ruby
    name = 'Paul Farrell'

    name.capitalize # Makes the string all upppercase
    name.length # Returns the length of the string
    name.uppercase # Returns the string all uppercase
    name.downcase # Returns the string all lowercase
    name.empty? # Returns true if the string is empty, otherwise false is returned
    name.start_with?('Paul') # Returns true if the string starts with the value passed in
    name.end_with?('Farrell') # Returns true if the string ends with the value passed in
    name.index('u') # Returns the index of the given value in relation to the string
    name.split # By default, returns an array of strings
```

## Basic Array Methods:
```ruby
    names = [ 'Paul', 'Daniel', 'Craig', 'Richard' ] # Create an array

    names[1] # Returns the item from the array based on its index
    names.first # Returns the first item from the array
    names.last # Returns the first item from the array
    names.length # Returns the number of items in the array
    name.empty? # Returns true if the array is empty, otherwise false is returned
    names.includes?('Craig') # Returns true or false if the particular item is in the array
    names.push('Sam') # Adds an item to the end of the array
    names.unshift('Sam') # Adds an item to the beginning of the array
    names.pop # Removes an item from the beginning of the array
```

## Array Iterator Methods:
```ruby
    names = [ 'Paul', 'Daniel', 'Craig', 'Richard' ]
    numbers = [ 32, 31, 29, 32]

    names.each { |name| puts name } # Iterates over each item in the array and leaves the original array unchanged
    name.find { |name| name.includes('l') } # Returns the first match from the array
    name.select { |name| name.includes('l') } # Returns ALL matches from the array (Filter)
    numbers.map { |number| number * 2 } # Creates a new array by modifying each item
```
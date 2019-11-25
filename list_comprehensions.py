# The following code
squares = []
for x in range(9):
    squares.append(x**2)
print(squares)

# Can become this with List Comprehensions (for even numbers)
squares = [x**2 for x in range(9) if x % 2 == 0]
print(squares)

# List Comprehensions with if-else
squares = [x**2 if x % 2 == 0 else x + 3 for x in range(9)]
print(squares)


# This code
cities = ['thessaloniki', 'athens', 'siros', 'heraklion']
capitalized_cities = []
for city in cities:
    capitalized_cities.append(city.title())
print(cities)

# Will become
capitalized_cities = [city.title() for city in cities]
print(cities)

# This is the code before
def double(x):
    return x * 2


double(3)

# And this is the code with Lambda
double = lambda x: x * 2
double(5)


"""
Lambda with Map

map() is a higher-order built-in function that takes a function and iterable as inputs, 
and returns an iterator that applies the function to each element of the iterable. 
The code below uses map() to find the mean of each list in numbers to create the list averages. 
"""

numbers = [
              [34, 63, 88, 71, 29],
              [90, 78, 51, 27, 45],
              [63, 37, 85, 46, 22],
              [51, 22, 34, 11, 18]
           ]

#def mean(num_list):
#    return sum(num_list) / len(num_list)

# averages = list(map(mean, numbers))

averages = list(map(lambda x: sum(x) / len(x), numbers))
print(averages)


"""
Lambda with Filter

filter() is a higher-order built-in function that takes a function 
and iterable as inputs and returns an iterator with the elements from the iterable for which the function returns True. 
The code below uses filter() to get the names in cities that are fewer than 
10 characters long to create the list short_cities.
"""

cities = ["New York City", "Los Angeles", "Chicago", "Mountain View", "Denver", "Boston"]

# def is_short(name):
#    return len(name) < 10

# short_cities = list(filter(is_short, cities))

short_cities = list(filter(lambda x: len(x) < 10, cities))
print(short_cities)
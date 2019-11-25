cast = {
    "Jerry Seinfeld": "Jerry Seinfeld",
    "Julia Louis-Dreyfus": "Elaine Benes",
    "Jason Alexander": "George Costanza",
    "Michael Richards": "Cosmo Kramer"
}

print("Iterating through keys:")
for key in cast:
    print(key)

print("\nIterating through keys and values:")
for key, value in cast.items():
    print("Actor: {}    Role: {}".format(key, value))

"""
Fruit Basket 1
"""

result = 0
basket_items = {'apples': 4, 'oranges': 19, 'kites': 3, 'sandwiches': 8}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Iterate through the dictionary
for i, count in basket_items.items():
    # if the key is in the list of fruits, add the value (number of fruits) to result
    if i in fruits:
        result += count

print(result)

"""
Fruit Basket 2
"""
# Example 1

result = 0
basket_items = {'pears': 5, 'grapes': 19, 'kites': 3, 'sandwiches': 8, 'bananas': 4}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here
for i, count in basket_items.items():
    #  if the key is in the list of fruits, add the value (number of fruits) to result
    if i in fruits:
        result += count
print(result)

# Example 2

result = 0
basket_items = {'peaches': 5, 'lettuce': 2, 'kites': 3, 'sandwiches': 8, 'pears': 4}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here
for i, count in basket_items.items():
    # if the key is in the list of fruits, add the value (number of fruits) to result
    if i in fruits:
        result += count
print(result)

# Example 3

result = 0
basket_items = {'lettuce': 2, 'kites': 3, 'sandwiches': 8, 'pears': 4, 'bears': 10}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here
for i, count in basket_items.items():
    # if the key is in the list of fruits, add the value (number of fruits) to result
    if i in fruits:
        result += count
print(result)

"""
Fruit Basket 3
"""

fruit_count, not_fruit_count = 0, 0
basket_items = {'apples': 4, 'oranges': 19, 'kites': 3, 'sandwiches': 8}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Iterate through the dictionary
for i, count in basket_items.items():
    # if the key is in the list of fruits, add to fruit_count.
    if i in fruits:
        fruit_count += count
    # if the key is not in the list, then add to the not_fruit_count
    else:
        not_fruit_count += count

print(fruit_count, not_fruit_count)

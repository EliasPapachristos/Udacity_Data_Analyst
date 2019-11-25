def cylinder_volume(height, radius):
    pi = 3.14159
    volume = height * pi * radius ** 2
    return volume


cylinder_volume(10, 3)
# print(cylinder_volume(10, 3))


"""
Print vs Return in Functions
"""


# this prints something, but does not return anything
def show_plus_ten(num):
    print(num + 10)


# this returns something
def add_ten(num):
    return num + 10


print('Calling show_plus_ten...')
print('Done calling')
print(f'This function returned: {show_plus_ten(5)}')

print('\nCalling add_ten...')
print('Done calling')
print(f'This function returned: {add_ten(5)}')

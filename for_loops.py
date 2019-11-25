# Creating a new list
cities = ['new york city', 'mountain view', 'chicago', 'los angeles']
capitalized_cities = []

for city in cities:
    capitalized_cities.append(city.title())

"""
Modifying
"""

cities = ['new york city', 'mountain view', 'chicago', 'los angeles']

for index in range(len(cities)):
    cities[index] = cities[index].title()

"""
Create Usernames
"""
names = ["Joey Tribbiani", "Monica Geller", "Chandler Bing", "Phoebe Buffay"]
usernames = []

# write your for loop here
for name in names:
    usernames.append(name.lower().replace(' ', '_'))

"""
Modify Usernames with Range
"""
usernames = ["Joey Tribbiani", "Monica Geller", "Chandler Bing", "Phoebe Buffay"]

# write your for loop here
for i in range(len(usernames)):
    usernames[i] = usernames[i].lower().replace(' ', '_')

print(usernames)

print(usernames)

"""
Tag Counter
"""

tokens = ['<greeting>', 'Hello World!', '</greeting>']
count = 0

# write your for loop here
for token in tokens:
    if token[0] == '<' and token[-1] == '>':
        count += 1

print(count)


"""
Create HTML List
"""

items = ['first string', 'second string']
html_str = "<ul>\n"  # "\ n" is the character that marks the end of the line, it does
                     # the characters that are after it in html_str are on the next line

# write your code here
for i in items:
    html_str += '<li>{}</li>\n'.format(i)
html_str += '</ul>'
print(html_str)


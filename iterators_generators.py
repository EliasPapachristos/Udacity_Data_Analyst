def my_range(x):
    i = 0
    while i < x:
        yield i
        i += 1


for n in my_range(6):
    print(5)

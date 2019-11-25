# My own generator function that works like the built-in function enumerate.

lessons = ["Why Python Programming", "Data Types and Operators", "Control Flow", "Functions", "Scripting"]


def my_enumerate(iterable, start=0):
    # Implement your generator function here
    count = start
    for el in iterable:
        yield count, el
        count += 1


for i, lesson in my_enumerate(lessons, 1):
    print(f"Lesson {i}: {lesson}")

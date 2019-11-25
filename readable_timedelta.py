"""
Write a function named readable_timedelta.
The function should take one argument, an integer days, and return a string that says how many weeks and days that is.
For example, calling the function and printing the result like this:
"""


def readable_timedelta(days):
    week = days // 7
    remainder = days % 7
    return f"{week} week(s) and {remainder} day(s)."


# test your function
print(readable_timedelta(10))

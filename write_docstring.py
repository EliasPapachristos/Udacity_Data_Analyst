def readable_timedelta(days):
    # insert your docstring here
    """
    Readable Timedelta is an awesome function made by me.

    It takes the days divided by seven and returns the remainder.
    """

    weeks = days // 7
    remainder = days % 7
    return f"{weeks} week(s) and {remainder} day(s)"


print(readable_timedelta(30))

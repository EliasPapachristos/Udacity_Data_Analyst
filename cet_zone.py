from datetime import datetime
import pytz

utc = pytz.utc
cet = pytz.timezone('Europe/Athens')

now = datetime.now(tz=utc)
cet_now = now.astimezone(cet)

print(now)
print(cet_now)

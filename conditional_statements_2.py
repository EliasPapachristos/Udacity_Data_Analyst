points = 174  # use this input to make your submission

# write your if statement here
if points <= 50:
    result = "Congratulations! You won a wooden rabbit!"
elif points <= 150:
    result = "Oh dear, no prize this time."
elif points <= 180:
    result = "Congratulations! You won a wafer-thin mint!"
else:
    result = "Congratulations! You won a penguin!"

print(result)

"""
Guess My Number
"""

answer = 10  # provide answer
guess = 10  # provide guess

if guess < answer:  # provide conditional
    result = "Oops!  Your guess was too low."
elif guess > answer:  # provide conditional
    result = "Oops!  Your guess was too high."
else:  # provide conditional
    result = "Nice!  Your guess matched the answer!"

print(result)


"""
Tax Purchase
"""

state = 'MN'  # Either CA, MN, or NY
purchase_amount = 20  # amount of purchase

if state == 'CA':  # provide conditional for checking state is CA
    tax_amount = .075
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

elif state == 'MN':  # provide conditional for checking state is MN
    tax_amount = .095
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

else:  # provide conditional for checking state is NY
    tax_amount = .089
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

print(result)

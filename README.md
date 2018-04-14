# Videogame Probability

You have just joined the illustrious Ewokin guild (group of players) in your favorite video game. This guild is known for attempting the hardest raids the instant that they are released. For these new raids you need the best gear (items) in order to have a viable chance of success. With your skills as a programmer, you have managed to determine the current drop rates for different item types in the game (drop rate refers to the probability of catching an item when the item is dropped). Now you need to know how likely it is that you will gather your gear (items) and bring your guild one step closer to success.

The Problem:

Given the number of different item types in a game, how many of each item type you need, the probability of obtaining (catching) each item type when it drops, and the maximum number of possible attempts you have for catching the items, determine the probability that you will obtain the desired number of each item type.

The Input:

The first input line contains a positive integer, n, indicating the number of test cases to process. Each test case starts with an integer, g (1 ≤ g ≤ 50), indicating the number of different item types in the game. The following g input lines provide the information about the different item types. Each such line contains two values: an integer, c (0 ≤ c ≤ 50), representing how many of this item type is needed, and a floating point number, p (0.0 ≤ p ≤ 1.0), representing the probability of catching this item type when it drops. The last input line for a test case contains an integer, a (0 ≤ a ≤ 10000), representing the maximum number of attempts you have for catching the items. Note that this last input represents the total number of attempts and not the attempts for each item type. An attempt can, of course, be used (applied) to obtain any item type.

The Output:

For each test case, print a floating point number on a line by itself, representing the probability that you will obtain the desired number of each item type. Output the results to 3 decimal places, rounded to the nearest thousandth (e.g., 0.0113 should round to 0.011, 0.0115 should round to 0.012, and 0.0117 should round to 0.012).


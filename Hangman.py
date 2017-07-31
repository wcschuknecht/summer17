import random
import linecache
import string
 
def welcome():
    print("Welcome to hangman! You have seven wrong guesses. Choose wisely!")
def restart():
    play_again = input("Would you like to play again (y/n): ")
    if play_again == 'y':
        game()
    else:
        quit()   
def winner():
    print("YOU WIN!")
    print("The word was:", dash)
    restart()
def lost():
    print("The word was: " + mystery)
    print("YOU LOSE!")
    restart()
    
welcome()

def game():
    HANGMANPICS = [" |---\n    |\n    |\n    |\n======", " |---\n O  |\n    |\n    |\n======", " |---\n O  |\n |  |\n    |\n======", " |---\n O  |\n/|  |\n    |\n======", " |---\n O  |\n/|\ |\n    |\n======", " |---\n O  |\n/|\ |\n/   |\n======", " |---\n O  |\n/|\ |\n/ \ |\n======"]
    global mystery
    mystery = linecache.getline('Hangman words.txt', random.randint(1, 1001))
    used = []
    global dash
    dash = ['_' for i in range(1, len(mystery))]
    guesses, index = 6, 0
    print(str(dash) + '\n')
    print(HANGMANPICS[index] + '\n')
    while guesses > 0:
        print('Guesses left: ' + str(guesses))
        choice = input("Guess the word, or choose a letter from the alphabet: ")
        while True:
            if choice == mystery[:-1]:
                dash = choice
                print("Nice! Way to take the risk and go for it!")
                winner()
            elif len(choice) > 1 and choice != mystery:
                index += 3
                guesses -= 3
                print("Oops! You went for the win too early! That's gonna cost you!")
                print(str(dash) + '\n')
                print(HANGMANPICS[index] + '\n')
                print('Guesses left: ' + str(guesses))
                choice = input("Try Again: ")
            elif choice not in string.ascii_lowercase:
                choice = input("Thats not valid! Try again: ")
                choice.lower()
            elif choice in used:
                choice = input("Thats already used! Try again: ")
                choice.lower() 
            else:
                break
        for position, letter in enumerate(mystery):
            if choice == letter:
                dash[position] = letter
                for i in dash:
                    if '_' not in dash:
                        winner()
            elif choice not in mystery:
                guesses -= 1
                index += 1
                break
        used.append(choice)
        print('Used letters: ' + str(used))
        print(str(dash) + '\n')
        print(HANGMANPICS[index] + '\n')
    lost()

game()

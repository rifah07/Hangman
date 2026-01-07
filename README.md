# Hangman Game

A command-line implementation of the classic word-guessing game Hangman, built with Ruby.

## Description

Hangman is a word-guessing game where players attempt to guess a secret word one letter at a time. The player has a limited number of incorrect guesses before losing the game. This implementation features word selection from a dictionary file, game state persistence through save/load functionality, and an interactive command-line interface.

## Features

- **Dictionary-based word selection**: Randomly selects words between 5-12 characters from a comprehensive word list
- **Input validation**: Ensures only valid single-letter guesses are accepted
- **Game state tracking**: Monitors guessed letters, remaining attempts, and game progress
- **Visual feedback**: Displays the word with blanks for unguessed letters and tracks incorrect guesses
- **Save/Load system**: Ability to save game progress and resume later using YAML serialization
- **User-friendly interface**: Clear prompts and status updates throughout gameplay

## Requirements

- Ruby 2.7 or higher
- `words.txt` file containing the dictionary (google-10000-english-no-swears.txt)

## Installation

1. Clone or download this repository
2. Ensure you have the `words.txt` file in the project root directory
3. Navigate to the project directory in your terminal

## File Structure

```
hangman/
├── main.rb
├── lib/
│   └── game.rb
├── words.txt
├── saved_games/
│   └── [saved game files]
└── README.md
```

## How to Play

1. Run the game:
   ```bash
   ruby main.rb
   ```

2. From the main menu, choose:
    - **New Game**: Start a fresh game with a random word
    - **Load Game**: Continue a previously saved game
    - **Exit**: Quit the application

3. During gameplay:
    - Enter a single letter to make a guess
    - Type `save` to save your current progress
    - You have 7 incorrect guesses before losing

4. Win by guessing all letters in the word, or lose when you run out of guesses

## Game Rules

- The secret word is between 5 and 12 characters long
- Guesses are case-insensitive
- You cannot guess the same letter twice
- You have 7 incorrect guesses allowed
- Only alphabetic characters are valid guesses

## Gameplay Example

```
=== HANGMAN ===
1. New Game
2. Load Game
3. Exit
Choose an option: 1

Welcome to the Hangman!

_ _ _ _ _ _ _ _ _
Remaining guesses: 7
Incorrect guessed letters: 

Enter a letter to guess (or 'save' to save the game):
e

Correct!

_ _ _ _ _ _ _ _ e
Remaining guesses: 7
Incorrect guessed letters: 

Enter a letter to guess (or 'save' to save the game):
```

## Save System

- Saved games are stored in the `saved_games/` directory
- Files are saved in YAML format with a `.yml` extension
- Each save file contains the complete game state:
    - Secret word
    - Previously guessed letters
    - Remaining incorrect guesses
- Load games by selecting from the list or entering the filename

## Technical Details

### Classes and Methods

**Game Class**
- `initialize`: Sets up a new game with a random word
- `select_secret_word`: Loads and filters words from dictionary
- `make_guess(letter)`: Processes a letter guess
- `won?`: Checks if the player has won
- `lost?`: Checks if the player has lost
- `game_over?`: Determines if the game has ended
- `display_word`: Shows the word with guessed letters revealed
- `display_status`: Displays game statistics
- `play`: Main game loop
- `save_game`: Serializes and saves the current game state
- `self.load_game(filename)`: Loads a saved game from file
- `self.list_saved_games`: Returns list of available save files

### Dependencies

- `yaml`: For game state serialization

## Acknowledgments

- Dictionary source: google-10000-english-no-swears.txt from the first20hours GitHub repository

## License

This project is open source and available for educational purposes.

---

Enjoy playing Hangman!
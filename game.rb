# frozen_string_literal: true

# This is the main class
class Game
  def initialize(secret_word) # = select_secret_word
    @secret_word = secret_word
    @guessed_letters = []
    @wrong_guesses_remaining = 7
  end

  # this method is to check each guess
  def make_guess(letter)
    return unless valid_input?(letter)
    return if already_guessed?(letter)

    process_guess(letter)
  end

  private

  def valid_input?(letter)
    return true if letter.length == 1 && letter.match?(/[a-z]/i)

    puts 'Invalid input.'
    false
  end

  def already_guessed?(letter)
    return false unless @guessed_letters.include?(letter.downcase)

    puts 'You already guessed that.'
    true
  end

  def process_guess(letter)
    letter.downcase!
    @guessed_letters << letter
    if @secret_word.chars.include?(letter)
      puts 'Correct!'
    else
      puts 'Wrong!'
      @wrong_guesses_remaining -= 1
    end
  end
end

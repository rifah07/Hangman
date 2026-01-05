# frozen_string_literal: true

# This is the main class
class Game
  def initialize(secret_word = select_secret_word)
    @secret_word = secret_word
    @guessed_letters = []
    @wrong_guesses_remaining = 7
  end
end

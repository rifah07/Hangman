# frozen_string_literal: true

# This is the main class
class Game
  def initialize(secret_word = select_secret_word)
    @secret_word = secret_word
    @guessed_letters = []
    @wrong_guesses_remaining = 7
  end

  def select_secret_word
    File.readlines('words.txt')
        .map(&:chomp)
        .select { |word| word.length.between?(5, 12) }
        .sample
  end

  # this method is to check each guess
  def make_guess(letter)
    return unless valid_input?(letter)
    return if already_guessed?(letter)

    process_guess(letter)
  end

  def won?
    @secret_word.chars.uniq.all { |letter| @guessed_letters.include?(letter) }
  end

  def lost?
    @wrong_guesses_remaining.zero?
  end

  def game_over?
    won? || lost?
  end

  def display_word
    @secret_word.chars.map do |letter|
      @guessed_letters.include?(letter) ? letter : '_'
    end.join(' ')
  end

  def display_status
    wrong_letters = @guessed_letters.reject { |letter| @secret_word.include?(letter) }

    puts "Remaining guesses: #{@wrong_guesses_remaining}"
    puts "Incorrect guessed letters: #{wrong_letters.join(', ')}"
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

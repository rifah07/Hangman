# frozen_string_literal: true

require_relative 'lib/game'

def main_menu
  loop do
    puts '\n=== HANGMAN ==='
    puts '1. New Game'
    puts '2. Load Game'
    puts '3. Exit'
    puts "Choose an option: \t"

    choice = gets.chomp

    case choice
    when '1'
      game = Game.new
      game.play
    when '2'
      load_saved_game
    when '3'
      puts 'Thanks for playing!'
      break
    else
      puts 'Invalid choice. Please enter 1, 2, or 3.'
    end
  end
end

def load_saved_game
  saved_games = Game.list_saved_games

  if saved_games.empty?
    puts 'No saved games found.'
    return
  end

  puts "\nSaved games:"
  saved_games.each_with_index { |file, index| puts "#{index + 1}. #{file}" }

  print 'Enter the number or filename: '
  input = gets.chomp

  filename = if input.match?(/^\d+$/)
               saved_games[input.to_i - 1]
             else
               input.end_with?('.yml') ? input : "#{input}.yml"
             end

  game = Game.load_game(filename.sub('.yml', ''))
  game&.play
end

main_menu

require_relative 'hangman_strings'

# responsible for gameplay functionality
class Game

    attr_reader :guesses_remaining, :guessed_letters
    attr_accessor :secret_word, :guess_string
  
    def initialize
      @secret_word = ''
      @guess_string = ''
      @guesses_remaining = 7
      @guessed_letters = []
    end
  
    def save_game(game)
      puts 'Would you like to save the game? (Y/N)'
      answer = gets.chomp().upcase
      return false unless answer_valid?(answer)
  
      if answer.upcase == 'Y'
        File.open('save_game', 'w') do |file|
          file.write(YAML.dump(game))
        end
      end
      true
    end
  
    def load_game(answer)
      if answer.upcase == 'Y'
        File.open('save_game', 'r') do |file|
        return YAML.load(file, permitted_classes: [Game])
        end
      end
    end 
  
    def answer_valid?(answer)
      answer.ord == 78 || answer.ord == 89 
    end
  
    def choose_secret_word
      lines = File.readlines('google-10000-english-no-swears.txt')
      words = []
      lines.each do |line|
       word = line.chomp 
       words << word if word.length >= 5 && word.length <= 12 
      end
    
      index = rand(0...words.length)
      words[index]
    end
  
    def make_empty_guess_string()
      '_' * secret_word.length
    end
  
    def display_guessed_letters
      puts "Your guessed letters are:"
      @guessed_letters.each do |letter|
        print letter + ", "
      end
      print "\n"
    end
  
    def make_guess
      loop do
        puts 'Choose a letter you think is in the secret word'
        letter = gets.chomp.downcase
        if @guessed_letters.include?(letter)
          next
        else
          if letter.length == 1 && letter.ord >= 97 && letter.ord <= 122 
            @guessed_letters << letter
            return letter
          end
        end
      end
    end 
  
    def correct_guess?(guess)
      unless @secret_word.include?(guess)
        @guesses_remaining -= 1
        return
      end
      fill_in_letter(guess)
    end 
  
    def fill_in_letter(guess)
      @secret_word.each_char.with_index do |char, index|
        @guess_string[index] = guess if char == guess
      end
    end
  
    def has_won?
      !@guess_string.include?('_')
    end
  
    def display_information
      hangman_strings = HangmanStrings.new
      puts hangman_strings.incorrect_strings[@guesses_remaining]
      puts "You've got #{@guesses_remaining} guesses remaining" 
      display_guessed_letters()
      puts "\n" + @guess_string
    end
  
  end
  
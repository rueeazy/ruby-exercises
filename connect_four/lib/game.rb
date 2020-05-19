require_relative 'board.rb'
require_relative 'player.rb'

class Game
    attr_accessor :game

    def initialize
        puts "Connect Four!"
        puts "\n"
        @game = Board.new
        @counter = 0
    end

    def red_chip
        red_chip = "\u{1F534}"
    end

    def blue_chip
        blue_chip = "\u{1F535}"
    end

    def game_start
        print "Time for some Connect Four! Enter your name player 1: "
        player1 = gets.chomp
        puts "#{player1} you are the red chip. #{red_chip}"
        symbol1 = red_chip
        @player_one = Player.new(player1, symbol1) 
        print "Enter your name player 2: "
        player2 = gets.chomp
        puts "#{player2} you are the blue chip. #{blue_chip}"
        symbol2 = blue_chip
        @player_two = Player.new(player2, symbol2)
        puts "Okay #{@player_one.name}, you're up. Make a move. \n "
        @game.display_board
        play_game
    end

    def play_game

        until @count == 42
            pick_space(@player_one)
            insert(@player_one)
            @game.display_board
           #break if check_winner?

            pick_space(@player_two)
            insert(@player_two)
            @game.display_board
            #break if check_winner?
        end
    end

    def pick_space(player)
        puts "Pick a column above #{player.name}"
        @column = gets.chomp.to_i - 1
        pick_space(player) if !valid_move?
    end

    def valid_move?
        if @game.board[@column][5] == "\u{26AB}"
            return true
        else
            puts "That column is full already."
            return false
        end
    end

    def insert(player)
        @game.board[@column].each_with_index do |space, idx|
            if space == "\u{26AB}"
                @game.board[@column][idx] = player.symbol
                @counter += 1
                break
            end
        end 
    end
 end

#game = Game.new
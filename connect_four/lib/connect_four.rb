require 'pry'
class Board
    attr_reader :board
    
    def initialize
        @board = Array.new(7) {Array.new(6, "\u{26AB}")}
    end

    def display_board
        puts "  #{@board[0][5]}  |  #{@board[1][5]}  |  #{@board[2][5]}  |  #{@board[3][5]}  |  #{@board[4][5]}  |  #{@board[5][5]}  |  #{@board[6][5]}"
        puts seperator = "------+------+------+------+------+------+------"
        puts "  #{@board[0][4]}  |  #{@board[1][4]}  |  #{@board[2][4]}  |  #{@board[3][4]}  |  #{@board[4][4]}  |  #{@board[5][4]}  |  #{@board[6][4]}"
        puts seperator
        puts "  #{@board[0][3]}  |  #{@board[1][3]}  |  #{@board[2][3]}  |  #{@board[3][3]}  |  #{@board[4][3]}  |  #{@board[5][3]}  |  #{@board[6][3]}"
        puts seperator
        puts "  #{@board[0][2]}  |  #{@board[1][2]}  |  #{@board[2][2]}  |  #{@board[3][2]}  |  #{@board[4][2]}  |  #{@board[5][2]}  |  #{@board[6][2]}"
        puts seperator
        puts "  #{@board[0][1]}  |  #{@board[1][1]}  |  #{@board[2][1]}  |  #{@board[3][1]}  |  #{@board[4][1]}  |  #{@board[5][1]}  |  #{@board[6][1]}"
        puts seperator
        puts "  #{@board[0][0]}  |  #{@board[1][0]}  |  #{@board[2][0]}  |  #{@board[3][0]}  |  #{@board[4][0]}  |  #{@board[5][0]}  |  #{@board[6][0]}"
        puts seperator
        puts "   1      2      3      4      5      6      7"
        puts "\n"
    end
end

class Player
    attr_accessor :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end

class Game
    attr_accessor :game

    def initialize
        puts "Connect Four!"
        puts "\n"
        @game = Board.new
        @counter = 0
        @player_one = nil
        @player_two = nil
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

    def check_winner?
    end


 end

#game = Game.new
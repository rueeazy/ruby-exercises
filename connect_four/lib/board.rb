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
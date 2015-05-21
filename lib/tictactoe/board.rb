module TicTacToe
  class Board
    # Creates a new board
    #
    # @param board [Array] an array representation of the board
    def initialize(board = Array.new(9, " "))
      @board = board
    end
    
    # Is the game over?
    #
    # @return [Boolean] has someone won or is it cats?
    def game_over?
      not @board.include?(" ") or win?
    end
    
    # @return [Array[Array]] returns an array of each row
    def rows
      @board.each_slice(3).to_a
    end
    # @return [Array[Array]] returns an array of each column
    def columns
      rows.transpose
    end
    # @return [Array[Array]] returns an array of both diagonals
    def diagonals
      [@board.values_at(0,4,8),@board.values_at(2,4,6)]
    end
    # @return [Array[Array]] all possible three in a row lines
    def lines
      rows + columns + diagonals
    end
    
    # @return [false | String] false if no one has won, the string of the player otherwise.
    def win?
      w = lines.find{|line| line[0] != " " and line.uniq.length == 1}
      w ? w[0] : false
    end
    
    # @param move [Integer] the place to play
    # @param player [String] the player who is playing.
    def play(move,player)
      @board[move]=player
    end
    
    # @return [String] A pretty printable string of the game.
    def to_s
      rows.map{|r|r.join(" | ")}.join("\n- * - * -\n") + "\n"
    end
    
    # @param move [Integer] the move to check
    # @return [Boolean] is the move valid?
    def valid_move?(move)
      @board[move] == " "
    end
  end
end
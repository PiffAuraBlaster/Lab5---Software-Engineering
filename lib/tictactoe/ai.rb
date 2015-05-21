module TicTacToe
  class AI
    attr_accessor :sign
    # Creates a new CLI based player with a given symbol
    #
    # @param sign [String] A single character string representing the players
    def initialize(sign)
      @sign = sign
    end
    
    # Makes AI go in first possible empty space.
    def get_move(board)
      move = 0
      until board.valid_move?(move)
        move += 1
      end
      return move
    end
    # Gets the string representing the player's sign.
    #
    # @return [String] the player's sign
    def to_s
      @sign
    end
  end
end

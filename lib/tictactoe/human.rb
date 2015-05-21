module TicTacToe
  class Human
    attr_accessor :sign
    # Creates a new CLI based player with a given symbol
    #
    # @param sign [String] A single character string representing the players
    def initialize(sign)
      @sign = sign
    end
    
    # Prompts the user for a valid move
    #
    # @param responder [Proc] where the prompt should print to.
    # @return [Integer] the index entered by the user
    def prompt(&responder)
      responder ||= lambda { gets }
      print "Enter a valid move for #{@sign}:  "
      responder.call.chomp.to_i
    end
    
    # Display the board and loop the prompt untill the user enters a valid index
    #
    # @param board [Board] the board to get a move for
    # @return [Integer] the index to play at
    def get_move(board)
      puts board.to_s
      until board.valid_move?(move = prompt)
        print "#{move} is not valid. "
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

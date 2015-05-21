module TicTacToe
  class Game
    # Initializes a new game with two players.
    # Players must respond to `get_move`.
    # 
    # @param p1 [Player] the player who goes first.
    # @param p2 [Player] the player who goes second
    def initialize(p1,p2)
      @players = [p1,p2]
      @board = Board.new
    end
    
    # Runs the game loop.
    def run
      until game_over?
        # Get the next move from the player and update the game state.
        @board.play(get_valid_move,@players[0].sign)
        increment_turn
      end
      if(w = @board.win?)
        puts "Game over #{w} wins!"
      else
        puts "Cat's game."
      end
    end
    
    # Check whether the game has ended.
    #
    # @return [Boolean] has the game ended?
    def game_over?
      @board.game_over?
    end
    
    # Check if the given move is valid.
    #
    # @param move [Integer] the index of the space to check
    # @return [Boolean] is the given move valid?
    def valid?(move)
      @board.valid_move?(move)
    end
    
    # Gets a valid move from the current player.
    #
    # @raise [RuntimeError] if the move is invalid.
    # @return [Integer] a valid move from the player.
    def get_valid_move
      move = get_move
      unless valid? move
        raise "Player: #{@players[0]} attempted the invalid move: #{move}"
      end
      return move
    end
    
    # Gets a move from the player with out checking it.
    #
    # @return [Integer] index that the player wanted to move.
    def get_move
      @players[0].get_move(@board)
    end
    
    # Switches who's turn it is.
    def increment_turn
      @players.rotate!
    end
  end
end
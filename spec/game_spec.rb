require_relative "../lib/tictactoe"

RSpec.describe TicTacToe::Game do
  before :all do
    @p1 = TicTacToe::Human.new("x")
    @p2 = TicTacToe::Human.new("y")
    @g = TicTacToe::Game.new(@p1,@p2)
  end
  it "should detect when the game is over" do
    expect(@g.game_over?).to be false
  end
  it "should detect if a move is valid" do
    expect(@g.valid?(0)).to be true
  end
end
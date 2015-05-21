require_relative "../lib/tictactoe"

RSpec.describe TicTacToe::Board do
  before :all do
    @b0 = TicTacToe::Board.new
    @b1 = TicTacToe::Board.new ["x","x","x",
                                "o","o","x",
                                "o","x","o"]
    @b2 = TicTacToe::Board.new
  end
  it "should pretty print with to_s" do
    expect(@b0.to_s).to eq(
      "  |   |  \n- * - * -\n  |   |  \n- * - * -\n  |   |  \n")
  end
  it "should get the board as an array of rows" do
    expect(@b1.rows).to eq([["x","x","x"],
                            ["o","o","x"],
                            ["o","x","o"]])
  end
  it "should get the board as an array of columns" do
    expect(@b1.columns).to eq([["x","o","o"],
                               ["x","o","x"],
                               ["x","x","o"]])
  end
  it "should get the board as an array of diagonals" do
    expect(@b1.diagonals).to eq([["x","o","o"],
                               ["x","o","o"]])
  end
  it "should get all possible 3-in-a-rows with lines" do
    expect(@b1.lines).to eq([["x","x","x"],
                             ["o","o","x"],
                             ["o","x","o"],
                             ["x","o","o"],
                             ["x","o","x"],
                             ["x","x","o"],
                             ["x","o","o"],
                             ["x","o","o"]])
  end
  it "should detect that moves outside of [0..8] are invalid" do
    expect(@b0.valid_move?(9)).to be false
  end
  it "should detect tha moves in taken spaces ar invalid" do
    expect(@b1.valid_move?(0)).to be false
  end
  it "should detect tha valid moves are free" do
    expect(@b0.valid_move?(0)).to be true
  end
  it "should detect when no one has won" do
    expect(@b0.win?).to be false
  end
  it "should detect when a player has won by returning the winning player" do
    expect(@b1.win?).to eq "x"
  end
  it "should detect when the game is over" do
    expect(@b0.game_over?).to be false
    expect(@b1.game_over?).to be true
  end
  it "should allow players to play in spaces" do
    @b2.play(3,"x")
    @b2.play(4,"x")
    @b2.play(5,"x")
    expect(@b2.win?).to eq "x"
  end
end
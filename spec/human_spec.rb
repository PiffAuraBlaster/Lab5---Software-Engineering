require_relative "../lib/tictactoe"

RSpec.describe TicTacToe::Human do
  before :all do
    @h = TicTacToe::Human.new("x")
  end
  it "should initialize with a string" do
    expect(@h).to be_instance_of(TicTacToe::Human)
  end
  it "should respond to to_s with its name" do
    expect(@h).to respond_to(:to_s)
    expect(@h.to_s).to eq("x")
  end
  it "should prompt the user for a move" do
    expect(@h).to respond_to(:prompt)
    expect{@h.prompt {"0"}}.to output("Enter a valid move for x:  ").to_stdout
  end
  it "should get a valid move for a board" do
    @b = TicTacToe::Board.new
    expect(@h).to respond_to(:get_move)
  end
end
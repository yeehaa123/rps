require 'rspec'

class Game

  attr_reader :game_values

  def initialize
    @game_values = %w{rock paper scissors}
  end

  def start(user_guess)
    if game_values.include? user_guess
      choose_winner(user_guess, computer_guess)
    else
      "Not Okay"
    end
  end

  def computer_guess
    game_values.sample
  end

  def choose_winner(user_guess, computer_guess)
    case user_guess
    when computer_guess then "noone wins"
    when "rock"
      case computer_guess
      when "paper" then "computer wins"
      when "scissors" then "user wins"
      end
    when "paper"
      case computer_guess
      when "scissors" then "computer wins"
      when "rock" then "user wins"
      end
    when "scissors"
      case computer_guess
      when "rock" then "computer wins"
      when "paper" then "user wins"
      end
    end
  end
end

describe Game do
  before do
    @game = Game.new
  end

  it "should only allow three input values" do
    @game.game_values.should == %w{rock paper scissors}
  end

  it "should say 'Not Okay' when it gets another input value" do
    @game.start("cup").should == "Not Okay"
  end

  it "should respond with one of the three game values" do
    @game.game_values.should include @game.computer_guess
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("rock", "paper").should == "computer wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("rock", "scissors").should == "user wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("rock", "rock").should == "noone wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("paper", "scissors").should == "computer wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("paper", "rock").should == "user wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("paper", "paper").should == "noone wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("scissors", "rock").should == "computer wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("scissors", "paper").should == "user wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("scissors", "scissors").should == "noone wins"
  end
end

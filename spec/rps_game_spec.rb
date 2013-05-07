require 'spec_helper'
require_relative '../rps_game'

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
		@game.choose_winner("rock", "paper").should include "computer wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("rock", "scissors").should include "user wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("rock", "rock").should include "noone wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("paper", "scissors").should include "computer wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("paper", "rock").should include "user wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("paper", "paper").should include "noone wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("scissors", "rock").should include "computer wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("scissors", "paper").should include "user wins"
  end

  it "should return 'computer wins' if user guesses 'rock' and computer guesses 'paper'" do
    @game.choose_winner("scissors", "scissors").should include "noone wins"
  end

	describe "#determine_value in array" do
		describe "should return value of input in array" do
			it "should return 0 if input is rock" do
				input = "rock"
				@game.determine_value(input).should == 0
			end

			it "should return 1 if input is paper" do
				input = "paper"
				@game.determine_value(input).should == 1
			end

			it "should return 2 if input is paper" do
				input = "scissors"
				@game.determine_value(input).should == 2
			end
		end
	end

	describe "#better_picker" do
		it "should return 1" do
			user_input = "paper"
			computer_input = "rock"
			@game.better_picker(user_input, computer_input).should == 1
		end
		
		it "should return 0" do
			user_input = "paper"
			computer_input = "paper"
			@game.better_picker(user_input, computer_input).should == 0
		end
		
		it "should return -1" do
			user_input = "scissors"
			computer_input = "rock"
			@game.better_picker(user_input, computer_input).should == -1
		end

		it "should return -1" do
			user_input = "rock"
			computer_input = "scissors"
			@game.better_picker(user_input, computer_input).should == 1
		end
	end
end

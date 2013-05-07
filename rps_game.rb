class Game

  attr_reader :game_values

  def initialize
    @game_values = %w{rock paper scissors}
  end

	def mock_me
		"You Lose"
	end

	def title
		"rock, paper, scissors"
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
    output = case user_guess
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
		"user guesses #{user_guess}, computer guesses #{computer_guess}, #{output}"
  end
end

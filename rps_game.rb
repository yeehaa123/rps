GameValue = Struct.new(:name, :index) do
	include Enumerable
end

class Game
  attr_reader :game_values

  def initialize
    @game_values = %w{rock paper scissors}
		@game_values.map!.with_index do |gv, i|
			GameValue.new(gv, i)
		end
  end

	def mock_me
		"You Lose"
	end

	def title
		"rock, paper, scissor"
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

	def determine_value input
		@game_values.find_index { |gv| gv.name == input }
	end

	def better_picker(user_guess, computer_guess)
		c = determine_value computer_guess
		u = determine_value user_guess
		2 > 1 > 0 > 2
		if c > u
			-1
		elsif c == u
			0
		elsif c < u
			if u == 2 && c == 0
				-1
			else
				1
			end
		end
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

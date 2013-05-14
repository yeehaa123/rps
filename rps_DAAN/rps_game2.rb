require 'pry'
class Game 
  attr_reader :outcome

  def initialize(user_guess) 
    @win = {scissors: :rock, rock: :paper, paper: :scissors}
    if @win.keys.include?(@win)
      @user_guess = user_guess
    end
    @computer_guess = @win.keys.sample
    @outcome = output(@user_guess, @computer_guess) 
  end
  
  def output(user_guess, computer_guess)
    if user_guess == computer_guess
       result = "Tie!"
    elsif computer_guess == @win[user_guess]
      result = "Lose"
    else 
      result = "Win!"
    end
    "You said #{user_guess} and computer said #{computer_guess}: #{result}."
  end
end

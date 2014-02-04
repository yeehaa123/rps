require 'sinatra'
require 'rspec'
require 'rack/test'
require 'pry'
 
get '/' do
  @title = "rock, paper, scissors"
  if params[:guess]
    erb "Scissors"
  else
    erb :home
  end
end
 
get '/rock' do
  @computer_input = ["scissors", "rock", "paper"].sample
  if computer_input == "scissors" 
    last_response.body.puts "You win"
  end 
  elsif computer_input == "rock"
    last_response.body.puts "It's a tie"
  end
  elsif computer_input == "paper"
    last_response.body.puts "Computer wins"
  end
end
 
get '/paper' do
  @computer_input = ["scissors", "rock", "paper"].sample
  if computer_input == "scissors" 
    last_response.body.puts "Computer wins"
  end
  elsif computer_input == "rock"
    last_response.body.puts "You win"
  end
  elsif computer_input == "paper"
    last_response.body.puts "It's a tie"
  end
end
 
get '/scissors' do #not very DRY but couldn't find another way
  @computer_input = ["scissors", "rock", "paper"].sample
  if computer_input == "scissors" 
    last_response.body.puts "It's a tie"
  end
  elsif computer_input == "rock"
    last_response.body.puts "Computer wins"
  elsif computer_input == "paper"
    last_response.body.puts "You win"
  end
end

set :environment, :test
 
describe 'Rock Paper Scissors App' do
  include Rack::Test::Methods
 
  def app
    Sinatra::Application
  end
 
  it "says welcome to rock, paper, scissors" do
    get '/'
    last_response.should be_ok
    last_response.body.should include "welcome to rock, paper, scissors"
  end
 
  it "when I say Rock it should respond with scissors" do
    get '/', guess: "Rock"
    last_response.body.should include "Scissors"
  end
end
 
__END__
 
@@form
 
@@home
<h1>welcome to <%= @title %></h1>
<p>"To play this game insert "rock", "paper" or "sciccors" after "localhost:4567"</p>
 
@@layout
<!doctype html>
<html lang="en">
<head>
  <title><%= @title %></title>
  <meta charset="utf-8">
</head>
<body>
  <%= yield %>
</body>
</html>

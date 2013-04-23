require 'sinatra'
require 'rspec'
require 'rack/test'
require 'pry'
require './rps_game'
require 'capybara'
get '/' do
  @title = "rock, paper, scissors"
  @output = Game.new.start("rock")
  if params[:guess]
    erb "Scissors"
  else
    erb :result
  end
end

set :environment, :test

describe 'Rock Paper Scissors App', :type => :feature do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says welcome to rock, paper, scissors" do
    get '/'
    last_response.should be_ok
    last_response.body.should include "welcome to rock, paper, scissors"
  end

  it "when I say rock it should respond with either win, lose, or draw" do
    get '/', guess: "Rock"
    last_response.body.should include "Scissors"
    page.should have_selector('h1', text: "win")
  end
end

__END__

@@form

@@home
<h1>welcome to <%= @title %></h1>

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

@@result
<h1><%= @output %></h1>

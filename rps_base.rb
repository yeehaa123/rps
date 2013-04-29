require 'sinatra'
require 'pry'
require 'spec_helper'
require './rps_game'

get '/' do
  @title = "rock, paper, scissors"
  @output = Game.new.start "rock"
  @welcome = "welcome to rock, paper, scissors"
  if params[:guess]
    erb :result
  else
    erb :welcome
  end
end

set :environment, :test

describe 'Rock Paper Scissors App' do

  it "says welcome to rock, paper, scissors" do
    get '/'
    last_response.should be_ok
    last_response.body.should include "welcome to rock, paper, scissors"
  end

  it "when I say rock it should respond with either user wins, computer wins, or noone wins" do
    get '/', guess: "Rock"
    last_response.body.should include "user"
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

@@welcome
<h1><%= @welcome %></h1>

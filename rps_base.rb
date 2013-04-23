require 'sinatra'
require 'rspec'
require 'rack/test'
require 'pry'
require './rps_game'

get '/' do
  @title = "rock, paper, scissors"
  if params[:guess]
    erb "Scissors"
  else
    erb :home
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

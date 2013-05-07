require 'sinatra'
require 'rspec'
require 'rack/test'
require 'pry'
require './rps_game'

get '/' do
  @title = "rock, paper, scissors"
  if params[:guess]
		@game =  Game.new.start("#{params[:guess]}")
  else
    erb :home
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

require 'sinatra'
require 'pry'
require 'rack/test'
require './rps_game'

get '/' do
	@game = Game.new
  if params[:guess]
		@game.start "#{params[:guess]}"
  else
		Bla= Struct.new(:bla, :blabla)
		@bla = Bla.new("Hello", "Hello")
    erb :home
  end
end

__END__

@@form

@@home
<h1>welcome to <%= @bla.bla %></h1>
<h2>welcome to <%= @bla.blabla %></h1>

@@layout
<!doctype html>
<html lang="en">
<head>
  <title><%= @game.title %></title>
  <meta charset="utf-8">
</head>
<body>
  <%= yield %>
</body>
</html>

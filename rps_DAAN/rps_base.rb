require 'sinatra'
require 'pry'
require './rps_game2.rb'
 
get '/' do
     erb :home
end
 
get '/:guess' do
  user_guess = "#{params[:guess]}"
  @game = Game.new(user_guess)
  erb @game.outcome
end
 
__END__
 
@@type 
 
@@home
<h1>Welcome to Rock Paper Scissors</h1>
<p> <img src="http://media.giphy.com/media/zrYgRi8JrMeC4/200.gif"> </p>
<p>To make your first move click on "rock", "paper" or "scissors"</p>
 
<li><a href="/guess=rock" title="rock">rock</a></li>
<li><a href="/guess=paper" title="paper">paper</a></li>
<li><a href="/guess=scissors" title="scissors">scissors</a></li>
 
@@output 
<p></p> 
 
@@layout
<!doctype html>
<html lang="en">
<head>
  <title>< Rock Paper Scissors ></title>
    <meta charset="utf-8">
    </head>
    <body>
      <%= yield %>
      </body>
      </html>

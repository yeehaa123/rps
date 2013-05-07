require 'spec_helper'
require_relative '../rps_base'

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

require 'spec_helper'
require_relative '../rps_base'

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
end

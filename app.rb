require 'cuba'
require 'cuba/contrib'
require 'rack'
require_relative 'helpers'
require './settings'

Cuba.plugin Cuba::Mote
Cuba.plugin Helpers

Dir['./lib/**/*.rb'].each { |f| require f }
Dir['./models/**/*.rb'].each { |f| require f }
Dir['./routes/**/*.rb'].each { |f| require f }

Cuba.use Rack::Static,
  urls: %w(/css /js /img),
  root: './public'

Cuba.define do
  on get do
    on root do
      email = session[:email]
      res.write view('index', email: email)
    end
  end

  on post do
    on 'login' do
      run Login
    end

    on 'logout' do
      session[:email] = nil
      res.redirect '/'
    end
  end
end

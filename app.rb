require 'cuba'
require 'cuba/contrib'
require 'ohm'
require 'ohm/contrib'
require 'rack'
require 'rack/protection'
require_relative 'helpers'
require './settings'

REDIS_URL = ENV.fetch 'REDIS_URL'

Cuba.plugin Cuba::Mote
Cuba.plugin Helpers
Cuba.use Rack::Protection

Ohm.connect url: REDIS_URL

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

  on 'products' do
    run Products
  end
end

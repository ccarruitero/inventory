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

Cuba.define do
  on 'products' do
    run Products
  end
end

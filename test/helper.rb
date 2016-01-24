ENV['REDIS_URL'] = 'redis://127.0.0.1:6379/13'
ENV['RACK_ENV'] = 'test'

require 'cuba/test'
require_relative '../app'

prepare do
  Ohm.flush
end

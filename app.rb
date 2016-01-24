require 'cuba'
require 'json'
require 'ohm'
require 'ohm/json'
require 'ohm/contrib'
require 'rack'
require_relative 'helpers'
require './settings'

Ohm.redis = Redic.new(ENV['REDIS_URL'])

Dir['./lib/**/*.rb'].each { |f| require f }
Dir['./models/**/*.rb'].each { |f| require f }
Dir['./routes/**/*.rb'].each { |f| require f }

Cuba.define do
  on 'products' do
    run Products
  end

  on 'suppliers' do
    run Suppliers
  end

  on 'warehouses' do
    run Warehouses
  end

  on 'entries' do
    run Entries
  end

  on 'entry_products' do
    run EntryProducts
  end

  on 'users' do
    run Users
  end
end

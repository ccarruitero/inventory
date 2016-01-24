require_relative 'helper'

scope do
  test 'should be a json api' do
    get '/products'
    assert_equal 200, last_response.status
    assert_equal 'application/json', last_response.headers['Content-Type']
  end
end

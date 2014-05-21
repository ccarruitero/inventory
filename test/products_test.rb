require_relative 'helper'

scope do
  setup do
  end

  test 'logged user required' do
    get '/products'
    assert_equal 302, last_response.status
  end
end

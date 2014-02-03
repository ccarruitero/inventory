require_relative 'helper'

scope do
  setup do
  end

  test 'logged user required' do
    get '/products'
    assert_equal '/', redirection_url
  end

  test 'create product' do
  end
end

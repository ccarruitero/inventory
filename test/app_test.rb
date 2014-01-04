require_relative 'helper'

scope do
  test 'Home' do
    get '/'
    assert last_response.ok?
  end
end

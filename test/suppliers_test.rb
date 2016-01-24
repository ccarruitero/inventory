require_relative 'helper'

scope do
  setup do
    Supplier.create
  end

  test 'get suppliers' do
    suppliers = Supplier.all.to_a.to_json
    get '/suppliers'
    assert_equal suppliers, last_response.body
  end
end

require_relative 'helper'

scope do
  setup do
    Product.create(name: 'product')
  end

  test 'get products' do
    products = Product.all.to_a.to_json
    get '/products'
    assert_equal products, last_response.body
  end

  test 'get product' do
    product = Product.all.to_a[0]
    get "/products/#{product.id}"
    assert_equal product.to_json, last_response.body
  end

  test 'create product' do
    post "/products", {name: "product0"}.to_json
    product = Product.all.to_a[1]
    assert_equal product.to_json, last_response.body
  end

  test 'update product' do
    put "/products/1", {name: "new name"}.to_json
    product = Product[1]
    assert_equal "new name", product.name
  end

  test 'delete product' do
    delete 'products/1'
    assert_equal 204, last_response.status

    products = Product.all.count
    assert_equal 0, products
  end
end

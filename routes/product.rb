class Products < API
  define do
    on root do
      on get do
        reply Product.all
      end

      on post do
        params = JSON.load(req.body.read)
        product= Product.create params
        reply product, 201
      end
    end

    on ':id' do |id|
      product = Product[id]

      on get do
        reply product
      end

      on put do
        params = JSON.load(req.body.read)
        product.update params
        reply product
      end

      on delete do
        product.delete
        res.status = 204
      end
    end
  end
end

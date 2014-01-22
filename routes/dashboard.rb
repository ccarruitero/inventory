class Dashboard < Cuba
  define do
    on default do
      if login?
        products = Product.all.to_a
        res.write view 'dashboard', products: products
      else
        res.redirect '/'
      end
    end
  end
end

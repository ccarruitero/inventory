class API < Cuba
  def reply obj, status=nil
    res.headers['Content-Type'] = 'application/json'
    res.status = status unless status.nil?
    res.write obj.to_json
  end

  def crud model
    on root do
      on get do
        reply model.all
      end

      on post do
        params = JSON.load(req.body.read)
        new_model = model.create params
        reply new_model, 201
      end
    end

    on ':id' do |id|
      current = model[id]

      on get do
        reply current
      end

      on put do
        params = JSON.load(req.body.read)
        current.update params
        reply current
      end

      on delete do
        current.delete
        res.status = 204
      end
    end
  end
end

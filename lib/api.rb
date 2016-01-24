class API < Cuba
  def reply obj, status=nil
    res.headers['Content-Type'] = 'application/json'
    res.status = status unless status.nil?
    res.write obj.to_json
  end
end

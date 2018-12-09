class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)

      item_name = req.path.split("/items/").last
      array = @@items.collect{|x| x.name}

      if array.include?(item_name)
        item_inst = @@items.detect{|x| x.name == item_name}
        resp.write item_inst.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

  resp.finish

  end

end

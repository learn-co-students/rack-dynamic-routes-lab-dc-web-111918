class Application

  @@items = [Item.new("iPhone", 600), Item.new("Apples", 3.69)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      i_name = req.path.split("/items/").last
      item = @@items.find {|item| item.name == i_name }
      if @@items.include?(item)
        resp.write item.price
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

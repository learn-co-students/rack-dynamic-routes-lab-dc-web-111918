class Application

@@items = [Item.new("Skateboard",16), Item.new("Apple", 1.99)]

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match(/items/)
    name_of_item = req.path.split("/items/").last
              if item = @@items.find{|x| x.name == name_of_item}
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

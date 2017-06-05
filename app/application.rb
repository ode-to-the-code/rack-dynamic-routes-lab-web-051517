require 'pry'

class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
    #localhost:9393/items/johann
    requested_product = req.path.split('/items/').last
    # end

    # if req.path=="/items/item"

         if  @@items.any? {|item| item.name == requested_product}
            @@items.each do |item|
              if item.name == requested_product
                resp.write "#{item.price}"
                resp.status = 200
              end
            end
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

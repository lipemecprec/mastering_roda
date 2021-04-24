# Hash matchers
require 'roda'

class App < Roda

  route do |r|  
    r.get ['israel', {all: ['posts', Integer]}] do |id|
        # GET /post matches as
        # GET /posts/1 matches as
        # GET /posts/new does not match as
      "<h1>#{id} é o cara</h1>"
    end
  end

  # route do |r|  
  #   r.on "posts", method: :post do |id|
  #       # GET /post matches as
  #       # GET /posts/1 matches as
  #       # GET /posts/new does not match as
  #     "#{id}"
  #   end
  # end

end
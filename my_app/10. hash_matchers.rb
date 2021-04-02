# Hash matchers
require 'roda'

class App < Roda

  route do |r|  
    r.get ['post', {all: ['posts', Integer]}] do |id|
        # GET /post matches as
        # GET /posts/1 matches as
        # GET /posts/new does not match as
      "#{id}"
    end
  end

end
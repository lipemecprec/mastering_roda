# Custom match methods
require 'roda'

class App < Roda
  class RodaRequest
    def with_params(hash, &block)
      hash.each do |key, value|
        return unless params[key] == value
      end

      on(&block)
    end
  end
  route do |r|
    r.with_params "secret"=>"Um9kYQ==\n" do
    end

    # Conditionals in match blocks
    r.on "posts" do
      posts = (0..5).map {|i| "Post #{i}"}

      r.get true do
        posts.join(" | ")
      end

      r.get Integer do |id|
        unless post = posts[id]
          response.status = 404
          next "No matching post"
        end

        access_time = Time.now.strftime("%H:%M")
        "Post: #{post} | Accessing at #{access_time}"
      end

      # r.get Integer do |id|
      #   if post = posts[id]
      #     access_time = Time.now.strftime("%H:%M")
      #     "Post: #{post} | Accessing at #{access_time}"
      #   end      
      # end
    end

    # Metaprogramming routes
    %w[about contact_us license].each do |route_name|
      r.get(route_name) { "You've accessed #{route_name}" } #view(route_name)
    end

    # String matchers 
    r.get "posts/today" do 
      # GET /posts/today
    end

  end
end
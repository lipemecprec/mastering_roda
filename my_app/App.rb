# Match methods
# http://localhost:9292
require "roda"

class App < Roda
    route do |r|
        r.on "posts" do
            post_list = {
                1 => "Post[1]",
                2 => "Post[2]",
                3 => "Post[3]",
                4 => "Post[4]",
                5 => "Post[5]",
            }

            r.is Integer do |id|
                post_list[id]
            end

            post_list.values.map { |post| post }.join(" | ")
        end
        r.on "hello" do
            "Hello, #{name}!"
        end
        r.on "goodbye" do
            "Farewell, #{name}!"
        end
    end
end
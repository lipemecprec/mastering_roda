# Custom match methods
require 'roda'

class App < Roda

  # Class matchers
  route do |r|
    # try http://localhost:9292/posts/new
    r.on "posts" do
      r.on String do |seg|
        "0 #{seg} #{r.remaining_path}"
      end
    end

    try http://localhost:9292/topics/about
    r.on String do |seg|
      "1 String #{seg} #{r.remaining_path}"
    end

    # try http://localhost:9292/2
    r.on Integer do |seg|
      "Integer #{seg.inspect} #{r.remaining_path}"
    end

  end
end
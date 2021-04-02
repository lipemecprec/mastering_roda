# Regexp matchers
require 'roda'

class App < Roda

  route do |r|
    r.on /posts/ do
      "# Same as 'posts' string matcher"
    end

    r.on /post/i do
      "# Similar to a case insensitive string matcher"
    end

    r.on /(posts|topics)/ do |seg|
      "# Match either of the two segments and yield the matched segment #{seg}"
    end

    r.on /posts(?:\.html)/ do
      "Sets .html as an option"
    end
    
    r.on /(\d\d\d\d)-(\d\d)-(\d\d)/ do |year, month, day|
      "#{day}/#{month}/#{year}"
    end

  end

end
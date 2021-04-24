# Hash matchers
require 'roda'

class App < Roda
  plugin :public
  
  ARTICLES = [
    "This is an article",
    "This is another article",
    "This is a post",
    "And this is whatever you want it to be",
  ]

  models = ["account", "post"]
  route do |r|

    r.root do
      r.redirect "/account/", 303
    end

    r.on "public" do
      r.public
    end
    
    r.on models do |model_name|
      model_class = Object.const_get(model_name.capitalize)
      
      r.get "index" do 
        model_class.all.join(" | ")
      end

      r.on Integer do |id|
        model = model_class[id]
        
        r.get "show" do
          model.to_s
        end

        r.post "update" do
          "Updating #{model}"
        end
      end
    end

    r.post "articles" do
      ARTICLES << r.params["content"]
      "Latest: #{ARTICLES.last} | Count: #{ARTICLES.count}"
    end

    r.on "search" do
      # r.params.inspect
      ARTICLES.filter do |article|
        article.include?(r.params["q"].to_s)
      end.join(" | ")
    end
  end
end
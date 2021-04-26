# Hash matchers
require 'roda'
# https://mrcook.uk/simple-roda-blog-tutorial
require "sequel"

database = "myapp_development"
user     = "postgres"
password = "Felipe04"
DB = Sequel.connect(adapter: "postgres", database: database, host: "127.0.0.1", user: user, password: password)

class Myapp < Roda
  plugin :multi_public, everyone: 'public', admin: 'admin_static'
  plugin :render
  plugin :static, ["/images", "/css", "/js"]
  plugin :head

  route do |r|
    r.root do
      r.redirect "/homepage"
    end

    r.get "homepage" do
      view("homepage")
    end

    r.get "about" do
      view("about")
    end
  
    r.get "contact" do
      view("contact")
    end
  end
end
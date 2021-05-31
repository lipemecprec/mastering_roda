# myapp.rb

# frozen_string_literal: true

# Hash matchers
require 'roda'
# https://mrcook.uk/simple-roda-blog-tutorial
require 'sequel'
# require 'pg'

require_relative './system/boot'

database = 'myapp_development'
user     = 'postgres'
password = 'Felipe04'
DB = Sequel.connect('postgres:///my_database')

Sequel::Model.plugin :validation_helpers
Sequel::Model.plugin :auto_validations
Sequel::Model.plugin :prepared_statements
Sequel::Model.plugin :single_table_inheritance

class Myapp < Roda
  #   plugin :multi_public, everyone: 'public', admin: 'admin_static'
  plugin :render
  plugin :static, ['/images', '/css', '/js']
  plugin :head
  plugin :all_verbs

  route do |r|
    r.root do
      r.redirect '/homepage'
    end

    r.get 'homepage' do
      view 'homepage'
    end

    r.on 'posts' do
      r.is ':id' do |id|
        @post = current_user.posts.find(id)

        r.get do
          @post
        end

        r.put do
          @post.update(r.params['post'])
        end

        r.delete do
          @post.destroy
        end
      end
    end

    r.get 'parser' do
      @param = %w[field handler css content xpath proc sep from key span offset cleanup
                  cleanup_replace extract enabled truncate_at].freeze
      @result = '::1 - - [05/May/2021:22:42:29 -0300] GET /parser?data_input= HTTP/1.1 200 5803 0.0059'
      view 'parser'
    end

    r.get 'about' do
      view 'about'
    end

    r.get 'contact' do
      view 'contact'
    end
  end
end

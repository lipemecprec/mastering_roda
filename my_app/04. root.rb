# # r.root
# require "roda"

# class App < Roda
#     route do |r|
#         r.root do # same as r.get ""
#             "Root Path"
#         end

#         r.on "posts" do
#             posts = (0..5).map {|i| "Post #{i+1}"}
#             r.get "" do # same as r.root
#                 posts.join(" | ")
#             end

#             r.get Integer do |id|
#                 posts[id]
#             end
#         end
#     end
# end
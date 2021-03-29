# # Match methods
# # http://localhost:9292
# require "roda"

# class App < Roda
#     route do |r|
#         r.on "posts" do
#             post_list = {
#                 1 => "Post[1]",
#                 2 => "Post[2]",
#                 3 => "Post[3]",
#                 4 => "Post[4]",
#                 5 => "Post[5]",
#             }
#             r.is Integer do |id|
#                 r.get true do

#                 end

#                 r.is "manage" do 
#                     r.get do
                    
#                     end
#                     r.post do
 
#                     end
#                 end
#             end

#             r.is do
#                 post_list.values.map { |post| post }.join(" | ")
#             end
#         end
#     end
# end
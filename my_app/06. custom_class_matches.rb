#Custom class matchers (I did`t manage to make it work)
require 'roda'

class App < Roda

  # plugin :class_matchers
  # 
  # class_matcher(Date, /(\d\d\d\d)-(\d\d)-(\d\d)/) do |y, m, d|
  #   [Date.new(y.to_i, m.to_i, d.to_i)]
  #  end
   
  # route do |r|
  #   r.on Date do |date|
  #     date.strftime('%m/%d/%Y')
  #   end
  # end

end
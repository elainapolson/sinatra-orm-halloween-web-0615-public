require 'pry'
class House < ActiveRecord::Base
  has_many :candies

  def unclaimed_candies
    self.candies.select {|candy| candy.bucket_id == nil}
  end

  def give_candy(kid)
    if kid.age < 18 
      kid.bucket.candies << unclaimed_candies.first
      "Happy Halloween!" 
    else
      "You're too old to trick-or-treat."
    end
  end

end
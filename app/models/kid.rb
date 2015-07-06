require 'pry'

class Kid < ActiveRecord::Base
  has_one :bucket
  has_many :candies, :through => :bucket

  def pig_out(n)
    if n == 1 || n == 2
      self.feeling = "Happy"
    elsif n >= 3
      self.feeling = "Sick"
    end

    n.times do 
      self.bucket.candies.last.destroy
    end

    self.save
  end


end
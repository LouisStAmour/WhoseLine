class Movie < ActiveRecord::Base
  has_many :clips
end

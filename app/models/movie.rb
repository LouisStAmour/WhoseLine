class Movie < ActiveRecord::Base
  has_many :clips, :dependent => :destroy
end

class Person < ApplicationRecord
  has_many :participants, :class_name => "Player", :dependent => :destroy
  has_many :games, :through => :participants, :source => :game
end

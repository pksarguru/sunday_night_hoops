class Game < ApplicationRecord
  has_many :participants, :class_name => "Player", :dependent => :destroy
  has_many :people, :through => :participants, :source => :person
end

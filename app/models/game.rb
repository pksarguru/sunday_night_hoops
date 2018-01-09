class Game < ApplicationRecord
  has_many :participants, :class_name => "Player", :dependent => :destroy
  has_many :people, :through => :participants, :source => :person

  def game_on?
    # method to count total players + guest is above 8
  end
end

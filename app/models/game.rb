# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  game_date  :string
#  cancelled  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  has_many :players, :class_name => "Player", :dependent => :destroy
  has_many :people, :through => :players, :source => :person

  def game_on?
    # method to count total players + guest is above 8
  end
end

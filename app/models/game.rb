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
  has_many :people, through: :players

  def game_on?
    # method to count total players + guest is above 8
  end

  def available_people
    Person.where.not(id: self.people.pluck(:id))
  end

  def player_count
    self.players.count + self.players.sum(&:guests)
  end
end

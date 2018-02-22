# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  cancelled  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_date  :date
#

class Game < ApplicationRecord
  has_many :players, :class_name => "Player", :dependent => :destroy
  has_many :people, through: :players

  def game_on?
    total_players = self.players.reduce(0) do |total_players, player|
      total_players + 1 + player.guests
    end

    total_players >=8 ? true : false
  end

  def available_people
    Person.where.not(id: self.people.pluck(:id))
  end

  def player_count
    self.players.count + self.players.sum(&:guests)
  end
end

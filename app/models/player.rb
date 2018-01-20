# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  game_id    :integer
#  guests     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ApplicationRecord
  belongs_to :person
  belongs_to :game

  delegate :name, to: :person
end

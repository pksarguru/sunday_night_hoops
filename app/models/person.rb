# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Person < ApplicationRecord
  has_many :players, :class_name => "Player", :dependent => :destroy
  has_many :games, :through => :players, :source => :game

  def collate_name(first_name:, last_name:)
    self.name = first_name + " " + last_name
  end
end

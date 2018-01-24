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
  attr_accessor :first_name, :last_name

  has_many :players, :class_name => "Player", :dependent => :destroy
  has_many :games, :through => :players, :source => :game

  def first_name
    self.name.split(' ').first
  end

  def last_name
    self.name.split(' ').last
  end

  def collate_name
    self.name = first_name.strip! + " " + last_name.strip!
  end
end

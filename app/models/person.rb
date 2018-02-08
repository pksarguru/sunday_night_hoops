# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  first_name :string
#  last_name  :string
#

class Person < ApplicationRecord
  attr_accessor :full_name

  has_many :players, :class_name => "Player", :dependent => :destroy
  has_many :games, :through => :players, :source => :game

  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def full_name
    [first_name, last_name].join(" ")
  end

  def full_name=(name)
    self.first_name = name.split(' ').first
    self.last_name = name.split(' ').last
  end
end

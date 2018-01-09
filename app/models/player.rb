class Player < ApplicationRecord
  belongs_to :person
  belongs_to :game
end

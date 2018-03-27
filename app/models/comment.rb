# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  person_id  :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_game_id    (game_id)
#  index_comments_on_person_id  (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (person_id => people.id)
#

class Comment < ApplicationRecord
  belongs_to :author, class_name: "Person", foreign_key: "person_id"
  belongs_to :game

  validates :text, presence: true
end

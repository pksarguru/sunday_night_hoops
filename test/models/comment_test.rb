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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

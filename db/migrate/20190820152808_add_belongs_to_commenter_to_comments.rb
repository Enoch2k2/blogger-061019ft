class AddBelongsToCommenterToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :commenter, foreign_key: true
  end
end

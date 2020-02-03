class AddMediaItemToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :media_item, foreign_key: true
  end
end

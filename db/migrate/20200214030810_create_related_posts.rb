class CreateRelatedPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :related_posts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :related_post, null: false, foreign_key: { to_table: :posts }
      t.integer :position
      t.text :text

      t.timestamps
    end
  end
end

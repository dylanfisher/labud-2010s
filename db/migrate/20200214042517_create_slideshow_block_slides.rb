class CreateSlideshowBlockSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slideshow_block_slides do |t|
      t.references :slideshow_block, null: false, foreign_key: true
      t.references :media_item, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end

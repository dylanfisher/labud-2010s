class AddCaptionToImageGridBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :image_grid_blocks, :caption, :text
  end
end

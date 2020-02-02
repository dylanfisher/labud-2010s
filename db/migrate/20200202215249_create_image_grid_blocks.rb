class CreateImageGridBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :image_grid_blocks do |t|
      t.integer :column_size
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('ImageGridBlock')
          BlockKind.create name: 'ImageGridBlock',
                           record_type: 'default',
                           category: 'Media',
                           description: 'A grid of images'
        end
      end

      change.down do
        BlockKind.where(name: 'ImageGridBlock').destroy_all
      end
    end
  end
end

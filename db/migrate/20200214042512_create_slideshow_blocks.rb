class CreateSlideshowBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :slideshow_blocks do |t|
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('SlideshowBlock')
          BlockKind.create name: 'SlideshowBlock',
                           record_type: 'default',
                           category: 'Media',
                           description: 'Add a series of images in a click through slideshow'
        end
      end

      change.down do
        BlockKind.where(name: 'SlideshowBlock').destroy_all
      end
    end
  end
end

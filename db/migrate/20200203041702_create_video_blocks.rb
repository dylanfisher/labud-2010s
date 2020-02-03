class CreateVideoBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :video_blocks do |t|
      t.references :media_item, null: false, foreign_key: true
      t.boolean :autoplay, default: false, null: false
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('VideoBlock')
          BlockKind.create name: 'VideoBlock',
                           record_type: 'default',
                           category: 'Media',
                           description: 'Add a video to the page'
        end
      end

      change.down do
        BlockKind.where(name: 'VideoBlock').destroy_all
      end
    end
  end
end

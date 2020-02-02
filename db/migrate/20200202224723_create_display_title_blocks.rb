class CreateDisplayTitleBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :display_title_blocks do |t|
      t.string :title
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('DisplayTitleBlock')
          BlockKind.create name: 'DisplayTitleBlock',
                           record_type: 'default',
                           category: 'Text',
                           description: 'A title block in a funky display typeface'
        end
      end

      change.down do
        BlockKind.where(name: 'DisplayTitleBlock').destroy_all
      end
    end
  end
end

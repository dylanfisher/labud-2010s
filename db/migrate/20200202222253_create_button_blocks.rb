class CreateButtonBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :button_blocks do |t|
      t.string :link_url
      t.string :link_label
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('ButtonBlock')
          BlockKind.create name: 'ButtonBlock',
                           record_type: 'default',
                           category: 'Misc',
                           description: 'A button that links to another URL'
        end
      end

      change.down do
        BlockKind.where(name: 'ButtonBlock').destroy_all
      end
    end
  end
end

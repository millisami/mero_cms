class CreateMeroCmsPages < ActiveRecord::Migration
  def change
    create_table :mero_cms_pages do |t|
      t.string :title
      t.text :content

      t.timestamps
    end

  end
end

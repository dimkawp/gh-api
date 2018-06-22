class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :prevTitle
      t.string :links, array: true, default: []
      t.string :description
      t.string :category, array: true, default: []
      t.string :img
      t.string :demoImg, array: true, default: []
      t.timestamps
    end
  end
end

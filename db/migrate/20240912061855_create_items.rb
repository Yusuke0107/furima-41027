class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer  :category_id , null:false
      t.integer  :condition_id , null:false
      t.integer  :shopping_cost_id , null:false
      t.integer  :shopping_days_id , null:false
      t.integer  :shopping_origin_id , null:false
      t.timestamps
    end
  end
end

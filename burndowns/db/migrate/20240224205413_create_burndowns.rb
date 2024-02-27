class CreateBurndowns < ActiveRecord::Migration[6.1]
  def change
    create_table :burndowns do |t|
      t.integer :project_id
      t.date :start_date
      t.date :end_date
      t.integer :issues_count
    end
  end
end

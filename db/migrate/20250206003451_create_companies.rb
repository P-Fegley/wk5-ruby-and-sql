class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      # note: rails automatically includes an autoincrementing id column
      t.string "name"
      t.string "city"
      t.string "state"
      t.string "url"
      t.timestamps # adds 'created_at' and 'updated_at' timestamp columns. Best practice to include; rails automatically starts with this
    end
  end
end

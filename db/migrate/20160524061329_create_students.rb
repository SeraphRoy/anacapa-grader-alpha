class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :studentid
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
    add_index :students, :email
  end
end

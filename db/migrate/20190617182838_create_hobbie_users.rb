class CreateHobbieUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbie_users do |t|
      t.integer :user_id
      t.integer :hobby_id

      t.timestamps
    end
  end
end

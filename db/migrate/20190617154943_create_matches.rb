class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :swiper_id
      t.integer :swiped_id

      t.timestamps
    end
  end
end

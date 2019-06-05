class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
      t.index [:user_id, :book_id], unique: true #お気に入り機能に追加
    end
  end
end

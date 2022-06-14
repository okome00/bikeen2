class CreateHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags do |t|
      ## カラム追加
      t.string :hashname ## ハッシュタグの名前

      t.timestamps
    end
    
  end
end

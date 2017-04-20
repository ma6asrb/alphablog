class CreateArticleNotes < ActiveRecord::Migration
  def change
    create_table :article_notes do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :note
      t.timestamps
    end
  end
end

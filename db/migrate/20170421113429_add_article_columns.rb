class AddArticleColumns < ActiveRecord::Migration
  def change
    add_column :articles, :action, :text
    add_column :articles, :action_target_date, :datetime
    add_column :articles, :action_user, :text
  end
end

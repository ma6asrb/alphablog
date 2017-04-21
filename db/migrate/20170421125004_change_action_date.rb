class ChangeActionDate < ActiveRecord::Migration
  def change
    change_column :articles, :action_target_date, :date
  end
end

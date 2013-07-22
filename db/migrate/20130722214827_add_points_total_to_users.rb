class AddPointsTotalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points_total, :integer

    User.find_each do |user|
      user.update_attribute(:points_total, user.karma_points.sum(:value))
    end
  end
end

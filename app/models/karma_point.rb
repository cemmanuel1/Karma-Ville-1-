class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  after_create :recal_karma

  def recal_karma
    old_karma = self.user.points_total
    self.user.update_attribute(:points_total, old_karma + self.value)
  end

end

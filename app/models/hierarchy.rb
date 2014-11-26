class Hierarchy < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  before_create :unique_name

  def unique_name
    unless Hierarchy.where(name: name, user_id: user.id).exists?
      true
    else
      false
    end
  end
end

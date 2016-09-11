class Item < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }

  #scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }

end

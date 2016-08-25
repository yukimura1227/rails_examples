class Blog < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :blog_comments, dependent: :destroy
end

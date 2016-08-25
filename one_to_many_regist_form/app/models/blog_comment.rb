class BlogComment < ActiveRecord::Base
  attr_accessible :blog_id, :comment
  belongs_to :blog
end

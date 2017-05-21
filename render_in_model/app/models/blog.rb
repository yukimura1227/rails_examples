# frozen_string_literal: true
class Blog < ActiveRecord::Base
  def self.hoge
    ActionView::Base.new(Rails.configuration.paths['app/views']).render(
      partial: 'blogs/dummy',
      formats: [:html],
      handlers: [:erb],
      locals: { moke: 'mugamuga' }
    )
  end
end

class Blog < ActiveRecord::Base
  has_attached_file :image,
                    styles: {
                      thumb: '100x100',
                      medium: '200x200',
                      large: '600x400'
                    },
                    storage: :s3,
                    s3_permissions: :private,
                    s3_credentials: "#{Rails.root}/config/s3.yml",
                    path: ':attachment/:id/:style.:extension'

  validates_attachment_content_type :image, content_type:
    [
      'image/jpg', 'image/jpeg', 'image/png', 'image/gif'
    ]
end

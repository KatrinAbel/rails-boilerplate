class Product < ApplicationRecord
  mount_uploader :attachement, AttachementUploader

  belongs_to :user
end

class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  mount_uploader :image, ImageUploader

  just_define_datetime_picker :publish_datetime

  validates :title, :presence => true
  validates :publish_datetime, :presence => true
  validates :image, :presence => true
end

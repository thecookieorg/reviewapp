class Restaurant < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	has_many :reviews

	validates :name, :address, :phone, :website, :image, presence: true
	validates :phone, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/,
  		message: "must be in the format (123) 456-7890" }

  	validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
  		message: "must start with http:// or https://" }

  	validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \w{6}\z/,
  		message: "must be in the format 123 Fake Avenue, Vancouver, BC V1C2AB" }
end

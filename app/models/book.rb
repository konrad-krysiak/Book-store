class Book < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true

	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, :default_url => "NoImageAvailable.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	has_many :infos, dependent: :destroy
	
	def to_s	
		"#{title}"
	end

end

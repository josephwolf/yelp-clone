class Restaurant < ActiveRecord::Base

  validates :name, presence: :true, format: { with: /\A[A-Z]/ }

	validates :address, presence: :true, length: { minimum: 3 }

	has_many :reviews

	def average_rating
		if reviews.any?
			# reviews.inject(0) { |total, review|
				# total + review.rating } / reviews.count.to_f
			reviews.average(:rating)
        else
        	'N/A'
        end

	end

end

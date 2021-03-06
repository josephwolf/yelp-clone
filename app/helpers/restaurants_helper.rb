module RestaurantsHelper

	def star_rating(value)
		return value unless value.respond_to?(:round)

		black_star = value.round
		white_star = 5 - value.round

		return ( '✦' * black_star ) + ( '✧' * white_star)
	end

	def percent_rating(value)
		return value unless value.respond_to?(:round)

		return value * 20
	end

end

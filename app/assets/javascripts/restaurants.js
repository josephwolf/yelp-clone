$(document).ready(function(){
	$('.new_review').on('submit', function(event){
		event.preventDefault();
		var currentRestaurant = $(this).closest('.restaurant');
		var reviewList = currentRestaurant.find('.reviews');
			
		$.post($(this).attr('action'), $(this).serialize(), function(review){
			var newReview = Mustache.render($('#review_template').html(),review);
			reviewList.append(newReview);

			currentRestaurant.find('.review_count').text(review.restaurant.review_count);
			currentRestaurant.find('.average_rating_number').text(review.restaurant.average_rating);
			currentRestaurant.find('.average_rating_stars').text(review.restaurant.average_rating_stars);
		});
	});
});
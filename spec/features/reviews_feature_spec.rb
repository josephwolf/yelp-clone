require 'spec_helper'

describe 'writing reviews' do 

before { restaurant = Restaurant.create(name: 'Big Riccos', address: '1 city road', cuisine: 'pizza')}

	xspecify 'restaurants begin with no reviews' do 
		visit '/restaurants'
		expect(page).to have_content '0 reviews'
	end


	it 'should be make a new review to an existing restaurant' do
 		visit '/restaurants/'
 		click_link 'Review Big Riccos'
		fill_in 'Review', with: 'Literally blew my mind.'
		select '5', from: 'Rating'
		click_button 'Create Review'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Literally blew my mind.'
		expect(page).to have_content '1 review'

	end

end
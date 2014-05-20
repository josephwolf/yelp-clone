require 'spec_helper.rb'

describe 'restaurants index page' do
	context 'no restaurants have been added' do
		it 'should display a message' do
			 visit '/restaurants'
			 expect(page).to have_content 'Lol no food 4 u!'
		end
	end
end

describe 'creating a restaurant' do
	it 'adds a restaurant to the index' do
		visit '/restaurants/new'
		fill_in 'Name', with: 'Big Riccos'
		fill_in 'Address', with: '1 City Road, London'
		click_button 'Create Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Big Riccos'
	end
end

describe 'editing a restaurant' do

	before { Restaurant.create(name: 'Big Riccos', address: '1 city road') }

	it 'can save edits and changes' do
		visit '/restaurants'
		click_link 'Edit Big Riccos'
		fill_in 'Name', with: 'Night Vale city hall'
		click_button 'Update Restaurant'
		expect(page).to have_content 'Night Vale city hall'
	end
end
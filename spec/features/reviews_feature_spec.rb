require 'spec_helper'

describe 'writing reviews' do

  before { restaurant = Restaurant.create(name: 'Big Riccos', address: '1 city road', cuisine: 'pizza')}

  specify 'restaurants begin with no reviews' do
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

describe 'average ratings' do

  before { restaurant = Restaurant.create(name: 'Big Riccos', address: '1 city road', cuisine: 'pizza')}

  it 'should display the average rating of a restaurant' do
    leave_review(4, 'would get food poisoning again!')
    leave_review(2, 'harrowing.')
    expect(page).to have_content 'Average rating: 3'
  end

end

describe 'star ratings' do

  before { restaurant = Restaurant.create(name: 'Big Riccos', address: '1 city road', cuisine: 'pizza')}

  it 'should express ratings as stars' do

  leave_review(4, 'would get food poisoning again!')
  leave_review(2, 'harrowing.')
  
    expect(page).to have_content "✦✦✦✧✧"
    expect(page).to have_content "✦✦✦✦✧"
    expect(page).to have_content "✦✦✧✧✧"
  end

end

def leave_review(rating, review)
  visit '/restaurants'
  click_link 'Review Big Riccos'

  fill_in 'Review', with: review
  select rating.to_s, from: 'Rating'
  click_button 'Create Review'
end

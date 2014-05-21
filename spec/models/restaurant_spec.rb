require 'spec_helper'


describe Restaurant do

  context 'Making a restaurant' do

    it 'should not be valid without capitalization' do
      restaurant = Restaurant.new(name: 'riccos')
      expect(restaurant).to have(1).error_on(:name)
    end

    it 'should not be valid without an address of sufficient length' do
      restaurant = Restaurant.new(address: 'na')
      expect(restaurant).to have(1).error_on(:address)
    end
  end

  context 'Creating an average review' do

    let(:restaurant) {Restaurant.create(name: 'Riccos', address: '1 city road', cuisine: 'pizza')}

    it 'should return N/A when no reviews are present' do

      expect(restaurant.average_rating).to eq 'N/A'

    end

    context 'when two reviews are present' do

      before do
        restaurant.reviews.create(rating: 3)
        restaurant.reviews.create(rating: 5)
      end

      it 'should return the average of both reviews' do
        expect(restaurant.average_rating).to eq 4
      end

    end

    context 'when the average shoudnt be a whole number' do

      before do
        restaurant.reviews.create(rating: 4)
        restaurant.reviews.create(rating: 5)
      end

      it 'should return the average of both reviews' do
        expect(restaurant.average_rating).to eq 4.5
      end

    end

  end

end

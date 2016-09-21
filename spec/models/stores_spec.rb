require 'rails_helper'

describe 'Stores', type: :model do
  it 'returns a list of objects with attributes' do
    VCR.use_cassette('stores') do
      stores = Stores.all_by(zipcode: 80202)
      store = stores.first

      expect(store.name).to eq 'Best Buy Mobile - Cherry Creek Shopping Center'
      expect(store.city).to eq 'Denver'
      expect(store.distance).to eq 3.25
      expect(store.phone_number).to eq '303-270-9189'
      expect(store.store_type).to eq 'Mobile'
    end
  end
end

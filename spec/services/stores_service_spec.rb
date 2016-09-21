require 'rails_helper'

describe 'Stores Service', type: :model do
  it 'returns a list of stores within 25 miles' do
    VCR.use_cassette('stores_within_25_miles') do
      stores = StoresService.new.all_by(zipcode: 80202)
      store = stores[:stores].first

      expect(store[:longName]).to eq 'Best Buy Mobile - Cherry Creek Shopping Center'
      expect(store[:city]).to eq 'Denver'
      expect(store[:distance]).to eq 3.25
      expect(store[:phone]).to eq '303-270-9189'
      expect(store[:storeType]).to eq 'Mobile'
    end
  end
end

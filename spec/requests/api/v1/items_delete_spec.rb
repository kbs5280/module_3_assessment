require 'rails_helper'

# When I send a DELETE request to /api/v1/items/1
# I receive a 204 JSON response if the record is successfully deleted

describe 'Items DELETE' do
  it 'returns a successful response' do
    item  = create(:item, name: 'Item 1', description: 'This is the first item.')

    delete 'api/v1/items/1'

    response.code.should eql '204'
  end
end

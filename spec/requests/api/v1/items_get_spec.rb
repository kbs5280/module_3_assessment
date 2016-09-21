require 'rails_helper'

# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items
# And each item has an id, name, description,
# and image_url but not the created_at or updated_at

describe 'Items GET' do
  it 'returns all items' do
    item  = create(:item, name: 'Item 1', description: 'This is the first item.')
    items  = create_list(:item, 9)

    get 'api/v1/items'

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.first["name"]).to eq 'Item 1'
    expect(json.first["description"]).to eq 'This is the first item.'
    expect(json.count).to eq 10
  end

  # When I send a GET request to /api/v1/items/1
  # I receive a 200 JSON response containing the id,
  # name, description, and image_url
  # but not the created_at or updated_at

  it 'returns an order_item by id' do
    item  = create(:item, id: '1', name: 'Item 1', description: 'This is the first item.')
    item  = create(:item, id: '2', name: 'Item 2', description: 'This is the second item.')

    get 'api/v1/items/2'

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["id"]).to eq 2
    expect(json["name"]).to eq 'Item 2'
    expect(json["description"]).to eq 'This is the second item.'
    expect(json.count).to eq 4
  end
end

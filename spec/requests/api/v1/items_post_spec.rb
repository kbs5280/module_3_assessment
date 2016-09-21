require 'rails_helper'

# When I send a POST request to /api/v1/items with a name, description, and image_url
# I receive a 201 JSON response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

describe 'Items POST' do
  it 'returns all items' do
    post 'api/v1/items', {name: 'Item 1', description: 'This is the first item.', image_url: 'http://tinyurl.com/j7yu945'}

    response.code.should eql '201'

    json = JSON.parse(response.body)

    expect(json["id"]).to eq 1
    expect(json["name"]).to eq 'Item 1'
    expect(json["description"]).to eq 'This is the first item.'
    expect(json["image_url"]).to eq 'http://tinyurl.com/j7yu945'
    expect(json.count).to eq 4
  end
end

require 'rails_helper'

# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results

describe 'Search for stores within 25 miles', type: :feature do
  scenario 'And see a list of the stores on the search index' do

    visit '/'
    fill_in 'zipcode', with: 80202
    click_on 'Search'

    expect(current_path).to eq '/search'

    expect(page).to have_content "Best Buy Mobile - Cherry Creek Shopping Center"
    expect(page).to have_content "Denver"
    expect(page).to have_content "3.25"
    expect(page).to have_content "303-270-9189"
    expect(page).to have_content "Mobile"
    expect(page).to have_selector('.stores', count: 10)
  end
end

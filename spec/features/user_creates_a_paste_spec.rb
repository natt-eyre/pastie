require "rails_helper"

feature "user creates a paste" do
  scenario "with valid data" do
    visit root_path
    fill_in "Name", with: "example.txt"
    fill_in "Contents", with: "wowee"
    click_on "Paste it!"
    expect(page).to have_content("example.txt")
    expect(page).to have_content("wowee")
  end
end

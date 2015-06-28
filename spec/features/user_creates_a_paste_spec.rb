require "rails_helper"

feature "user creates a paste" do
  scenario "with valid data" do
    submit_paste name: "example.txt", contents: "wowee"

    expect(page).to have_content("example.txt")
    expect(page).to have_content("wowee")
  end

  scenario "with invalid data" do
    submit_paste name: "example.txt", contents: ""
    
    expect(page).to have_content("can't be blank")
  end

  def submit_paste(name:, contents:)
    visit root_path(as: create(:user))
    fill_in "Name", with: name
    fill_in "Contents", with: contents
    click_on "Paste it!"
  end
end

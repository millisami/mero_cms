require 'spec_helper'

describe "pages" do
  it "creating a new page" do
    visit pages_path
    click_link "New Page"
    fill_in "Title", :with => "First page"
    fill_in "Content", :with => "Content for the page"
    click_button "Create Page"

    within "p#flash_notice" do
      page.should have_content("Page has been created!")
    end

    within "#pages" do
      page.should have_content("First page")
    end
  end
end

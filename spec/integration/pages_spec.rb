require 'spec_helper'

describe "Page" do
  
  # let(:page) { MeroCms::Page.create!(:title => "About Us", :content => "The about us content.") }
  context "unauthenticated user" do
    before do
      sign_out!
    end
    
    it "cannot create a new page" do
      visit new_page_path
      page.current_url.should eql(send(MeroCms::Engine.login_url))
    end
  end

  context "authenticated but not authorized user" do
    before do
      sign_in!
    end
    
    it "cannot create a new page" do
      visit new_page_path
      debugger
      page.current_url.should eql(send(MeroCms::Engine.unauthorized_url))
    end
  end
  
  it "show a single page" do
    cms_page = MeroCms::Page.create!(:title => "About Us", :content => "The about us content.")

    visit page_path(cms_page)
    within "#page h2" do
      page.should have_content("About Us")
    end
    within "#page .mero_cms_page" do
      page.should have_content("The about us content.")
    end
  end
  
  context "authenticated and authorized user" do
    before do
      sign_in_as_authorized!
    end
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

    it "edit a page" do
      cms_page = MeroCms::Page.create!(:title => "About Us", :content => "The about us content.")

      visit page_path(cms_page)
      click_link "Edit"

      fill_in "Title", :with => "Contact Us"
      fill_in "Content", :with => "Following is the contact us info"
      click_button "Update Page"

      within "p#flash_notice" do
        page.should have_content("Page updated!")
      end

      within "#page h2" do
        page.should have_content("Contact Us")
      end

      within "#page .mero_cms_page" do
        page.should have_content("Following is the contact us info")
      end
    end

    it "destroy a page" do
      cms_page = MeroCms::Page.create!(:title => "About Us", :content => "The about us content.")

      visit page_path(cms_page)
      click_link "Destroy"
      within "p#flash_notice" do
        page.should have_content("Page destroyed!")
      end
    end    
  end
end

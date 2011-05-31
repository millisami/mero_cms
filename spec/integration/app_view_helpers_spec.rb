require 'spec_helper'

describe "Page#ViewHelpers" do
  context "view helper" do
    before do
      @page = MeroCms::Page.create!(:title => "About Us", :content => "The about us content.")
    end
    
    it "should show both title and the content" do
      visit "/home"

      within("#mero_cms_chunk_with_default") do
        page.should have_content("About Us")
        page.should have_content("The about us content.")
      end
    end

    it "should show only the content" do
      visit "/home"

      within("#mero_cms_chunk_only_content") do
        page.should_not have_content("About Us")
        page.should have_content("The about us content.")
      end
    end

    it "should show only the number of words specified of the content" do
      visit "/home"

      within("#mero_cms_chunk_only_content") do
        page.should_not have_content("About Us")
        page.should have_content("The about us content.")
      end
    end
    
  end
end
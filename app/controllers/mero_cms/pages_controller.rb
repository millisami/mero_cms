module MeroCms
  class PagesController < ApplicationController
    respond_to :html, :json
    def index
      @pages = MeroCms::Page.all
    end

    def new
      @page = MeroCms::Page.new
    end
    
    def create
      @page = MeroCms::Page.new(params[:page])
      @page.save
      flash[:notice] = "Page has been created!"
      respond_with(@page, :location => pages_path)
    end
  end
end

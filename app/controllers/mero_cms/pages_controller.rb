module MeroCms
  class PagesController < ApplicationController
    respond_to :html, :json
    
    before_filter :authenticate_and_authorize_mero_cms_user!, :except => [:show, :index]
    
    def index
      @pages = MeroCms::Page.all
      respond_with(@pages)
    end

    def show
      @page = MeroCms::Page.find(params[:id])
      respond_with(@page)
    end

    def new
      @page = MeroCms::Page.new
      respond_with(@page)
    end

    def create
      @page = MeroCms::Page.new(params[:page])
      if @page.save
        flash[:notice] = "Page has been created!"
      end
      respond_with(@page, :location => pages_path)
    end

    def edit
      @page = MeroCms::Page.find(params[:id])
      respond_with(@page)
    end

    def update
      @page = MeroCms::Page.find(params[:id])
      if @page.update_attributes(params[:page])
        flash[:notice] = "Page updated!"
      else
        flash[:alert] = "Page could not be updated!"
      end
      respond_with(@page, :location => page_path(@page))
    end

    def destroy
      @page = MeroCms::Page.find(params[:id])
      @page.destroy
      flash[:notice] = "Page destroyed!"
      respond_with(@page)
    end
  end
end

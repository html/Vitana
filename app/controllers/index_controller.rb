class IndexController < ApplicationController
  def index
    load_menu

    if params[:category]
      @category = Category.find params[:category]
    elsif params[:page]
      @page = Page.find(params[:page])
      @category = @page.category
    else
      @category = Category.first :order => :position
    end

    load_additional_data
  end
  
  def search
    load_menu
    @pages = []

    if params[:q]
      @results = []
    end
  end

  protected
  
    def load_menu
      @menu_items = Category.all(:order => :position)
    end

    def load_category
    end

    def load_additional_data
      if @category.show_answers
        @answers = Answer.random_two
      else
        @answers = []
      end

      if @category.show_gallery
        @images  = Image.random_three
      else
        @images = []
      end

      @pages =@category.pages
      if @pages.size == 1
        @page = @pages.first
      end
    end
end

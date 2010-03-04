class IndexController < ApplicationController
  def index
    load_menu

    if params[:category]
      @category = Category.find params[:category]
      @children = @category.children

      if @children.empty?
        @parent = @category.parent
      end
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
    @submenu_items = []

    if params[:q]
      @results = Search.find(params[:q])
      @values = params[:q].to_s.split /\s+/
    end
  end

  protected
  
    def load_menu
      @menu_items = Category.all(:order => :position, :conditions => { :parent_id => nil })
    end

    def load_category
    end

    def load_additional_data
      if @category.show_answers
        @answers = Answer.random_two
      else
        @answers = []
      end

      @pages = @children && !@children.empty? ? @children : @category.pages

      if @pages.size == 1
        @page = @pages.first
      end


      if @page && @page.category && @page.category.parent
        @parent = @page.category.parent
      end
      @submenu_items = @parent ? @parent.children : @pages


      if @category.show_gallery && @page
        @images  = Image.random_three @page
      else
        @images = []
      end
    end
end

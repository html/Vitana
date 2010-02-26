class IndexController < ApplicationController
  def index
    @menu_items = Category.all(:order => :position)

    if params[:category]
      @category = Category.find params[:category]
    elsif params[:page]
      @page = Page.find(params[:page])
      @category = @page.category
    else
      @category = Category.first :order => :position
    end

    if @category.show_answers
      @answers = @category.answers.random_two
    else
      @answers = []
    end

    @pages =@category.pages
  end
end

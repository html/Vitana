# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def param_key_for(item)
    item.is_a?(Category) ? :category : :page
  end
end

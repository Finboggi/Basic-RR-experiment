# frozen_string_literal: true

module LinksHelper
  def link_title
    @product.name + ' at ' + @shop.name
  end
end

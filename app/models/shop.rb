# frozen_string_literal: true

class Shop < ApplicationRecord
  def parse_value_from_html(html_content)
    case name
    when 'Ulmart'
      parse_value_from_ulmart(html_content)
    end
  end

  private

  def parse_value_from_ulmart(html_content)
    price_css_selector = 'section[itemtype="http://schema.org/Product"] meta[itemprop="price"]'

    price_tag = Nokogiri::HTML(html_content).css(price_css_selector)
    price_value = price_tag.attribute('content').value

    price_value.to_f
  end
end

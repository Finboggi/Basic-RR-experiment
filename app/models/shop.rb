class Shop < ApplicationRecord

  def parse_value_from_html(html_content)
    case name
    when 'Ulmart'
      parse_value_from_ulmart(html_content)
    end
  end

  private

  def parse_value_from_ulmart(html_content)
    price_css_selector = '.panel-body .b-product-card__price .b-price__num.js-price'

    value_string = Nokogiri::HTML(html_content).css(price_css_selector).text

    value_string.scan(/\d+/).join.to_f
  end
end

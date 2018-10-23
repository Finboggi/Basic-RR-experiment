require 'net/http'

class UpdatePriceForLinkJob < ApplicationJob
  def perform(link_id)
    link = Link.find(link_id)
    url = URI(link.url)
    html_content = Net::HTTP.get(url)

    value = link.shop.parse_value_from_html(html_content)

    Price.create(link: link, value: value, parsed_at: Time.current)
  end
end

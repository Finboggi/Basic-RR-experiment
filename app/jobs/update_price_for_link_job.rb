class UpdatePriceForLinkJob < ApplicationJob
  def perform(link)
    url = URI(link.url)
    html_content = Net::HTTP.get(url)

    value = link.shop.parse_value_from_html(html_content)

    Price.create(link: link, value: value, parsed_at: Time.current)
  end
end

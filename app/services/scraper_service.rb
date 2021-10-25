require 'nokogiri'
require 'net/http'

class ScraperService

  def self.fetch_assets(url)
    error = [false, { error: 'Invalid Url' }]
    return error if !url.is_a?(String) && url.blank?

    begin
      html = Net::HTTP.get(URI(url))
      doc  = Nokogiri::HTML(html)
      img_tags  = doc.css('img')
      href_tags = doc.css('a')
      assets  = img_tags.map { |img| img.attributes['src']&.value }.compact
      links   = href_tags.map { |tag| tag.attributes['href']&.value }.compact
      [true, { assets_count: assets.count, links_count: links.count,
               assets: assets, links: links }]
    rescue StandardError => e
      Rails.logger.info "Error while fetching assets: #{e.message}"
      [false, { error: e.message }]
    end
  end
end

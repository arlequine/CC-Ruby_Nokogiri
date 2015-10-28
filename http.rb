require 'net/http'
require 'nokogiri'

class Page
  def initialize(url)
  	@uri = URI(url)
  	res = Net::HTTP.get(@uri)
  	@doc = Nokogiri::HTML(res)
  	end

  def fetch!
  	puts "url> #{@uri}"
  	puts "Fetching..."
  	p links = @doc.css('nav li> a').inner_text
  end

  def links
  	p links = doc.css('nav a').map {|link| link['href']}
  	
  end

  def title
  	 title = @doc.search('title').inner_text
  end
end

link = Page.new("http://www.codea.mx")
link.fetch!
#p link.links

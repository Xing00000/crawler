require 'nokogiri'
require 'open-uri'
require 'mechanize'
# Let's try to fetch and parse HTML document

# books = Nokogiri::HTML(open('http://www.books.com.tw/activity/gold66_day/?loc=activity_BK_001'))

# puts "### Search for nodes by css with Bookstore"
# books.css('div h1 a').each do |link|
#   puts link.content
# end



agent = Mechanize.new

# cookie = Mechanize::Cookie.new()
# cookie.domain = "its.taipei.gov.tw"
# cookie.path = "/"

# agent.cookie_jar.add!(cookie)


agent.get('http://its.taipei.gov.tw/m/aspx/park/parkF.aspx?lang=Cht%C2%AEion=%E5%A3%AB%E6%9E%97%E5%8D%80&sn=072')
agent.cookie_jar.save("cookies.yaml", session: true)
agent.cookie_jar.load("cookies.yaml")

[72,68].each do |p|

	page = agent.get('http://its.taipei.gov.tw/m/aspx/park/parkF.aspx?lang=Cht%C2%AEion=%E5%A3%AB%E6%9E%97%E5%8D%80&sn='+"0#{p}")
	table1 = page.search('#labTotal')
	text1 = table1.inner_text
	table2 = page.search('#labSpace')
	text2 = table2.inner_text

	puts "總格位: #{text1}"
	puts "剩餘格位: #{text2}"
end


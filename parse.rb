require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Enter Story ID:"
story_id = gets.chomp
base_url = "https://www.fanfiction.net/s/#{story_id}/"
story = Nokogiri::HTML(open(base_url))
last_page = Integer(story.at_css('#chap_select option:last-of-type').attr('value'))# find out how many pages are in the story
title = story.css('link[rel=canonical]')[0]['href'].split('/').last # grab the hyphen delineated title

full_story = "#{title}.html"
template_begin = "<html><head><style>@import url(http://fonts.googleapis.com/css?family=Merriweather:400,700,400italic|Montserrat:400);body {max-width: 42em; margin: 0 auto; font: 20px/1.75 Merriweather,Georgia,serif; background-color: #fafafa !important; color: #38444a;} h1,h2,h3,h4,h5 {font-family: Montserrat,Arial,Helvetica,sans-serif;}</style></head><body><p><a href=\"#{base_url}\">#{title}</a></p>"
template_end = "</body></html>"
# Populate the html file with head, styles, link to story
File.open(full_story, "w") do |file|
  file.write(template_begin)
end

# Grab the story content from each page
for page_num in 1..last_page
  page = Nokogiri::HTML(open("#{base_url}#{page_num}"))
  content = page.css("div#storytext")
  # append the story content to the file
  File.open(full_story, "a") do |file|
       file.write(content)
  end
  # some status feedback
  puts "Copied page #{page_num} of #{last_page}"
  sleep 3
end

# Finish off the html
File.open(full_story, "a") do |file|
  file.write(template_end)
end
# And we're done!
puts "Story downloaded"
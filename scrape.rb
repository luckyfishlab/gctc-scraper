require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open('./data/directory.html'))

mh = {}
doc.css('html body table tbody tr td table tbody tr td blockquote table tbody tr td.body').each do |member|
    puts member.content
    mh[member.content] = {}
end    

doc.css('html body table tbody tr td table tbody tr td blockquote table tbody tr td.body a').each do |member|
    mh[member.content]['href'] = member['href']
end

require 'yaml'
yaml_obj = YAML::dump mh
File.open('members.yaml','w') do | file |
    file.write(yaml_obj)
end




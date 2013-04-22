xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Events"
    xml.description "All the events avaliable"
    xml.link events_url(format: :rss)
    
    for event in @events
      xml.item do
        xml.title event.title
        xml.description event.body
        xml.pubDate event.created_at.to_s(:rfc822)
        xml.author "Michael Biggs"
      end
    end
  end
end
 json.channel do
    json.title "Events"
    json.description "All the Upcoming Events"
   json.link events_url(format: :rss)
    
    for event in @events
      json.item do
        json.title event.title
        json.description event.body
        json.pubDate event.created_at.to_s(:rfc822)
         json.author do |author|
          author.name "Michael Biggs"
        end
      end
    end
  end

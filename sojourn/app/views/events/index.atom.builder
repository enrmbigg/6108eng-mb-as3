atom_feed do |feed|
  feed.title("The OSC Events Feed")
  feed.updated(@events.first.created_at)
  @events.each do |article|
    feed.entry(article) do |entry|
      entry.title(article.title)
      entry.content(article.body, :type => 'html')
      entry.description(article.description, :type => 'html')
        entry.author do |author|
          author.name "Michael Biggs"
        end
    end
  end
  
end
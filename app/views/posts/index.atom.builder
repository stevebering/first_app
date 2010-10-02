atom_feed do |feed|
	feed.title("My homebrew blog")
	feed.updated(@posts.first.created_at)
	
	@posts.each do |post|
		feed.entry(post) do |entry|
			entry.title(post.title)
			entry.content(post.content, :type => "html")
			entry.author { |author| author.name("Steve Bering") }
		end
	end
end
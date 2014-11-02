module UsersHelper

    def fetch_links(capacity,user_id,str = "")
    loaded = false
    links = []
    while !loaded do
      User.all[user_id].links.each do |link|
        links.push(link) if link.url.include?(str)
        if links.size == capacity
          loaded = true
          break
        end
      end
      loaded = true
    end
    links.uniq

  end

end

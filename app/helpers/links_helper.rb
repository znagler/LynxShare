module LinksHelper

  def add_hashtag(tag)
    "#" + tag
  end

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

  def pad(string)
    " " + string
  end

  def remove_hashtags(words)
    words.map!{ |word| word.gsub("#","") }
  end

  def format_tags(words_array)
    remove_hashtags(pad(words_array).scan(/[#\s](\S*)/).flatten)
  end

  def get_link_card(link)
    render :partial => "link", :locals => {:link => link}
  end
end

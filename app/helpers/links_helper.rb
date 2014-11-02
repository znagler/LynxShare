module LinksHelper

  def add_hashtag(tag)
    "#" + tag
  end

  def fetch_links(capacity,int2)
    load_size = 0
    load = {}
    until load_size > capacity do
      load["item#{load_size}"] = "example_url #{load_size}"
      load_size += 1
    end
    load
  end
end

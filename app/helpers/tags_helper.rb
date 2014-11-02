module TagsHelper
  def fetch_tags(capacity,user_id,str = "")
    loaded = false
    tags = []
    while !loaded do
      current_user.tags.each do |tag|
        tags.push(tag) if tag.name.include?(str)
        if tags.size == capacity
          loaded = true
          break
        end
      end
      loaded = true
    end
    tags.uniq

  end
end

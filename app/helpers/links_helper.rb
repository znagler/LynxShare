module LinksHelper

  def add_hashtag(tag)
    "#" + tag
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
  
end

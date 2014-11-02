module UsersHelper
  def fetch_users(capacity,user_id,str = "")
    loaded = false
    users = []
    while !loaded do
      current_user.unfollowed_users.each do |user|
        users.push(user) if user.username.include?(str) && user.id != user_id
        if users.size == capacity
          loaded = true
          break
        end
      end
      loaded = true
    end
    users.uniq
  end
end

module UsersHelper
    def fetch_users(capacity,user_id,str = "")
    loaded = false
    users = []
    while !loaded do
      User.all.each do |user|
        # binding.pry
        users.push(user) if user.username.include?(str) && user.id != user_id
        if users.size == capacity
          loaded = true
          break
        end
      end
      loaded = true
    end
    # binding.pry
    users.uniq

  end
end

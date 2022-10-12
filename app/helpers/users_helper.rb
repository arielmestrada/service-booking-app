module UsersHelper
    def complete_name(user)
        "#{user.first_name} #{user.last_name}"
    end
end

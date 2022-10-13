module UsersHelper
    def complete_name(user)
        "#{user.first_name} #{user.last_name}"
    end

    def complete_address(user)
        "#{user.street}, #{user.village}, #{user.city}, #{user.province}, #{user.postal_code}"
    end 
end

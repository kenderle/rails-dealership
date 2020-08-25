class EmployeesServices

    def self.login(username, password)
        return false unless user = User.find_by(username: username).try(:authenticate, password)
        user.generate_token!
        user
    end

    def self.register(position, first_name, last_name, username, password, password_confirmation)
        user = User.new({
                            position: position,
                            first_name: first_name,
                            last_name: last_name,
                            username: username,
                            password: password,
                            password_confirmation: password_confirmation
        })

        return false unless user.valid?
        user.save
        user.generate_token!
        user
    end

    def self.logout(user)
        user.update(token: nil)
    end
end
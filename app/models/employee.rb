class Employee < ApplicationRecord
    validates :username, uniqueness: true
    has_secure_password

    def profile
        {
            id: id,
            first_name: first_name,
            last_name: last_name,
            username: username,
            position: position,
            token: token
        }
    end

    def generate_token!
        update_attribute :token, AccessToken.new(self).generate
    end
end

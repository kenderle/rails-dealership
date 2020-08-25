class EmployeesServices

    def self.login(username, password)
        return false unless employee = Employee.find_by(username: username).try(:authenticate, password)
        employee.generate_token!
        employee
    end

    def self.register(position, first_name, last_name, username, password, password_confirmation)
        employee = Employee.new({
                            position: position,
                            first_name: first_name,
                            last_name: last_name,
                            username: username,
                            password: password,
                            password_confirmation: password_confirmation
        })

        return false unless employee.valid?
        employee.save
        employee.generate_token!
        employee
    end

    def self.logout(employee)
        employee.update(token: nil)
    end
end
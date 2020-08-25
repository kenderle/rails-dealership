class DealershipsService


    def self.establish(title, phone, street1, street2, city, state, zip_code)
        dealership = Dealership.new({
                            title: title,
                            phone: phone,
                            street1: street1,
                            street2: street2,
                            city: city,
                            state: state,
                            zip_code: zip_code
        })

        return false unless dealership.valid?
        dealership.save
        dealership
    end

end
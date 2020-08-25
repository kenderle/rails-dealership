class Dealership < ApplicationRecord

    def profile
        {
            id: id,
            title: title,
            phone: phone,
            street1: street1,
            street2: street2,
            city: city,
            state: state,
            zip_code: zip_code
        }
    end
end

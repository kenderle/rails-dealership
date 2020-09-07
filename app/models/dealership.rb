class Dealership < ApplicationRecord

    def initialize(attributes=nil)
        attr_with_defaults = {:state => "Missouri"}.merge(attributes)
        super(attr_with_defaults)
      end

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

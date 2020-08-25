class DealershipsService


    def self.register(make, model, year, color, description, price, dealership_id, cost, image)
        car = Car.new({
                            make: make,
                            model: model,
                            year: year, 
                            color: color,
                            description: description,
                            price: price,
                            dealership_id: dealership_id,
                            cost: cost,
                            image: image
        })

        return false unless car.valid?
        car.save
        car
    end

end
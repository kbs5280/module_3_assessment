class Stores
  attr_reader :name,
              :city,
              :distance,
              :phone_number,
              :store_type

  def initialize(store)
    @name         = store[:longName]
    @city         = store[:city]
    @distance     = store[:distance]
    @phone_number = store[:phone]
    @store_type   = store[:storeType]
  end

  def self.all_by(params)
    stores = StoresService.new.all_by(params)
    stores[:stores].map do |store|
      Stores.new(store)
    end
  end
end

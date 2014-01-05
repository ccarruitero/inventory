class Supplier < Ohm::Model
  attribute :name
  reference :product, :Product
end

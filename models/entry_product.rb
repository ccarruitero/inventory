class EntryProduct < Ohm::Model
  include Ohm::DataTypes

  attribute :amount, Type::Decimal
  attribute :price, Type::Decimal
  reference :product, :Product
  reference :entry, :Entry
end

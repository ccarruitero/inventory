class Entry < Ohm::Model
  include Ohm::DataTypes

  attribute :date, Type::Time
  reference :supplier, :Suplier
  reference :warehouse, :Warehouse
  collection :entry_products, :EntryProduct
end

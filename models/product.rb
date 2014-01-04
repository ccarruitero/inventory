class Product < Ohm::Model
  include Ohm::DataTypes

  attribute :name
  attribute :initial_amount, Type::Decimal
  attribute :category_id
  attribute :price, Type::Decimal
  collection :suppliers, Supplier
  collection :entries, EntryProduct

  unique :name
end

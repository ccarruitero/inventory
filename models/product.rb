class Product < Ohm::Model
  include Ohm::DataTypes

  attribute :name
  attribute :initial_amount, Type::Decimal
  attribute :category_id
  attribute :price, Type::Decimal
  collection :suppliers, :Supplier
  collection :entries, :EntryProduct

  unique :name

  def to_hash
    super.merge name: name,
                initial_amount: initial_amount,
                category_id: category_id,
                price: price
  end
end

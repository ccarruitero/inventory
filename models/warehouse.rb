class Warehouse < Ohm::Model
  attribute :name

  collection :entries, Entry
end

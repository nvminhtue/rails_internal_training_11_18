class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  belongs_to :publisher, class_name: User::Publisher.name,
    foreign_key: :publisher_id
  has_many :rentings
  has_many :renters, ->{distinct}, class_name: User::Renter.name, through: :rentings

  accepts_nested_attributes_for :author

  validates :name, presence: true,
    length: {maximum: Settings.validations.strings_max_length}
  validates :number_of_pages, presence: true,
    numericality: {greater_than: 0}
  validates :price, presence: true,
    numericality: {greater_than: 0}

  delegate :name, to: :author, prefix: :author, allow_nil: true
  delegate :name, to: :category, prefix: :category, allow_nil: true
  delegate :name, to: :publisher, prefix: :publisher, allow_nil: true
end

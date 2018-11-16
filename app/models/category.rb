class Category < ApplicationRecord
  belongs_to :parent, class_name: Category.name, optional: true
  has_many :books, dependent: :destroy
  has_many :sub_categories, class_name: Category.name, foreign_key: :parent_id
end

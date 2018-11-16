# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :parent, class_name: Category.name
  has_many :books, dependent: :destroy
  has_many :sub_categories, class_name: Category.name, foreign_key: :parent_id
end

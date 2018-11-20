# frozen_string_literal: true

class Renting < ApplicationRecord
  belongs_to :book
  belongs_to :renter, class_name: User::Renter.name, foreign_key: :user_id
end

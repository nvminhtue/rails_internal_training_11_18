# frozen_string_literal: true

class User::Publisher < User
  has_many :books, foreign_key: :publisher_id
end

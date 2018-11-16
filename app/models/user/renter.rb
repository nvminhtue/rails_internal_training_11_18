class User::Renter < User
  has_many :rentings, foreign_key: :user_id, dependent: :destroy
end

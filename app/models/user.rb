class User < ApplicationRecord
  scope :publisher_all, ->{where(type: User::Publisher.name)}
end

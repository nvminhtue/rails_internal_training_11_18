require "rails_helper"

RSpec.describe Renting, type: :model do
  describe "Association" do
    it {is_expected.to belong_to :book}
    it {is_expected.to belong_to(:renter).class_name(User::Renter.name)
      .with_foreign_key(:user_id)}
  end
end

require "rails_helper"

RSpec.describe User::Renter, type: :model do
  describe "Association" do
    it {is_expected.to have_many :rentings}
  end
end

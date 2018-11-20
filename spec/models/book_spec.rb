require "rails_helper"

RSpec.describe Book, type: :model do
  describe "Association" do
    it {is_expected.to have_many :rentings}
    it {is_expected.to have_many :renters}
    it {is_expected.to belong_to :author}
    it {is_expected.to belong_to :category}
    it {is_expected.to belong_to :publisher}
  end

  describe "Validation" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of(:name).
      is_at_most(Settings.validations.strings_max_length)}
    it {is_expected.to validate_presence_of :number_of_pages}
    it {is_expected.to validate_presence_of :price}
  end
end

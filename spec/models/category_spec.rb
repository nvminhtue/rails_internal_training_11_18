require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Association" do
    it {is_expected.to have_many :books}
    it {is_expected.to have_many(:sub_categories).class_name(Category.name)
      .with_foreign_key(:parent_id)}
    it {is_expected.to belong_to(:parent).class_name(Category.name)}
  end
end

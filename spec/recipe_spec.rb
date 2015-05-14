require('spec_helper')

describe(Recipe) do
  it { should have_and_belong_to_many(:categories) }
  it { should have_many(:ingredients) }
  it { should have_many(:instructions) }
  it { should validate_presence_of(:description) }
end

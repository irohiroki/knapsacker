RSpec.describe Knapsacker do
  Item = Struct.new(:value, :cost)

  it "has a version number" do
    expect(Knapsacker::VERSION).not_to be nil
  end

  describe "#pack" do
    let(:knapsacker) { Knapsacker.new(items, capacity: 4) }

    context "with 2 items" do
      let(:items) { [item1, item2] }
      let(:item1) { Item.new(1, 4) }
      let(:item2) { Item.new(3, 2) }

      it "returns the more valuable one" do
        expect(knapsacker.pack).to eq([item2])
      end
    end
  end
end

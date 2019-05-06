RSpec.describe Knapsacker do
  Item = Struct.new(:value, :cost)

  it "has a version number" do
    expect(Knapsacker::VERSION).not_to be nil
  end

  describe "#pack" do
    let(:knapsacker) { Knapsacker.new(items, capacity: capacity) }

    context "with 2 items" do
      let(:items) {[
        Item.new(1, 4),
        Item.new(3, 2),
      ]}
      let(:capacity) { 4 }

      it "returns the more valuable one" do
        expect(knapsacker.pack).to eq([items[1]])
      end
    end

    context "sample problem 1" do
      # from https://www.youtube.com/watch?v=9kbzMeEBvUY
      let(:items) {[
        Item.new(3, 7),
        Item.new(5, 3),
        Item.new(4, 8),
        Item.new(9, 3),
        Item.new(10, 9),
        Item.new(6, 11),
      ]}
      let(:capacity) { 20 }

      it "returns item index 1, 3, and 4" do
        expect(knapsacker.pack).to contain_exactly(items[1], items[3], items[4])
      end
    end

    context "sample problem 2" do
      # from https://www.youtube.com/watch?v=X3-SUumKcLQ
      let(:items) {[
        Item.new(30, 5),
        Item.new(20, 10),
        Item.new(100, 20),
        Item.new(90, 30),
        Item.new(160, 40),
      ]}
      let(:capacity) { 60 }

      it "returns item index 2 and 4" do
        expect(knapsacker.pack).to contain_exactly(items[2], items[4])
      end
    end

    context "sample problem 3" do
      # from https://www.youtube.com/watch?v=rTRnnbsIA-k
      let(:items) {[
        Item.new(10, 2),
        Item.new(10, 4),
        Item.new(12, 6),
        Item.new(18, 9),
      ]}
      let(:capacity) { 15 }

      it "returns item index 0, 1, and 3" do
        expect(knapsacker.pack).to contain_exactly(items[0], items[1], items[3])
      end
    end
  end
end

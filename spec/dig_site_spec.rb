RSpec.describe DigSite do
  describe "state" do
    let(:dig) { DigSite.new }
    let(:activity) { Activity.new }

    it "represents a dig with no activities as finished" do
      expect(dig).to be_finished
    end

    it "represents a dig with an unfinished activity as unfinished" do
      dig.activities << activity
      expect(dig).not_to be_finished
    end

    it "considers a dig as finished if all activities are finished" do
      dig.activities << activity
      activity.set_finished
      expect(dig).to be_finished
    end
  end

  describe "costs" do
    let(:dig) { DigSite.new }
    let(:finished) { Activity.new(cost: 10, finished: true) }
    let(:small_unfinished) { Activity.new(cost: 2) }
    let(:large_unfinished) { Activity.new(cost: 25) }

    before(:example) do
      dig.activities = [finished, small_unfinished, large_unfinished]
    end

    it "provides a total cost of all activities" do
      expect(dig.total_cost).to eq(37)
    end

    it "provides a remaining cost based on unfinished activities" do
      expect(dig.remaining_cost).to eq(27)
    end
  end
end

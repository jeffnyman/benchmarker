RSpec.describe Activity do
  let(:activity) { Activity.new }

  describe "state" do
    it "represents new activities as unfinished" do
      expect(activity).not_to be_finished
    end

    it "represents activities as finished" do
      activity.set_finished
      expect(activity).to be_finished
    end
  end

  describe "pace" do
    let(:activity) { Activity.new(cost: 5) }

    it "does not count unfinished activities toward pace" do
      expect(activity).not_to be_part_of_pace
      expect(activity.counts_towards_pace).to eq(0)
    end

    it "counts recently finished activities toward pace" do
      activity.set_finished(1.day.ago)
      expect(activity).to be_part_of_pace
      expect(activity.counts_towards_pace).to eq(5)
    end

    it "does not count non-recent finished activities toward pace" do
      activity.set_finished(1.month.ago)
      expect(activity).not_to be_part_of_pace
      expect(activity.counts_towards_pace).to eq(0)
    end
  end
end

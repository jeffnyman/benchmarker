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

  describe "pace" do
    let(:dig) { DigSite.new }
    let(:finished_recently) { Activity.new(cost: 5, finished: 1.day.ago) }
    let(:finished_awhile_ago) { Activity.new(cost: 10, finished: 1.month.ago) }
    let(:small_unfinished) { Activity.new(cost: 2) }
    let(:large_unfinished) { Activity.new(cost: 25) }

    before(:example) do
      dig.activities = [finished_recently, finished_awhile_ago, small_unfinished, large_unfinished]
    end

    it "provides a calculation based on finished activities" do
      expect(dig.finished_pace).to eq(5)
    end

    it "provides a calculation of current rate of finishing activities" do
      expect(dig.current_pace).to eq(1.0 / 2.8)
    end

    it "provides the projected days of work remaining" do
      expect(dig.projected_days_remaining).to eq(75.6)
    end

    it "provides an indication of not being on time" do
      dig.ideal_finish_date = 2.weeks.from_now
      expect(dig).not_to be_on_time
    end

    it "provides an indication of being on time" do
      dig.ideal_finish_date = 3.months.from_now
      expect(dig).to be_on_time
    end
  end
end

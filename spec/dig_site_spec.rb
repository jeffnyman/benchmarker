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
end

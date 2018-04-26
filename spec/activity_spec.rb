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
end

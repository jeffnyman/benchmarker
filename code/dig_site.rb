class DigSite
  attr_accessor :activities

  def initialize
    @activities = []
  end

  def finished?
    activities.all?(&:finished?)
  end
end

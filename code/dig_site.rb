class DigSite
  attr_accessor :activities

  def initialize
    @activities = []
  end

  def finished?
    unfinished_activities.empty?
  end

  def total_cost
    activities.sum(&:cost)
  end

  def remaining_cost
    unfinished_activities.sum(&:cost)
  end

  def unfinished_activities
    activities.reject(&:finished?)
  end
end

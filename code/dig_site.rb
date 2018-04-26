class DigSite
  attr_accessor :activities, :ideal_finish_date

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

  def finished_pace
    activities.sum(&:counts_towards_pace)
  end

  def current_pace
    finished_pace * 1.0 / 14
  end

  def projected_days_remaining
    remaining_cost / current_pace
  end

  def on_time?
    (Date.today + projected_days_remaining) <= ideal_finish_date
  end
end

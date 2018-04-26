class Activity
  attr_accessor :cost

  def initialize(setup = {})
    @finished = setup[:finished]
    @cost = setup[:cost]
  end

  def finished?
    @finished
  end

  def set_finished(date = Time.current)
    @finished = date
  end

  def part_of_pace?
    return false unless @finished
    @finished > 14.days.ago
  end

  def counts_towards_pace
    part_of_pace? ? cost : 0
  end
end

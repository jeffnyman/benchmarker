class Activity
  attr_accessor :cost

  def initialize(setup = {})
    @finished = setup[:finished]
    @cost = setup[:cost]
  end

  def finished?
    @finished
  end

  def set_finished
    @finished = true
  end
end

class Activity
  def initialize
    @finished = false
  end

  def finished?
    @finished
  end

  def set_finished
    @finished = true
  end
end

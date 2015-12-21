class Item
  attr_accessor :name, :rank, :just_stolen

  def initialize(name, rank)
    @name = name
    @rank = rank
    @number_of_times_stolen = 0
    @just_stolen = false
  end

  def frozen?
    @number_of_times_stolen >= 3
  end

  def steal
    @number_of_times_stolen += 1
    @just_stolen = true
  end
end
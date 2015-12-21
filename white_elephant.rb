require './item'

class WhiteElephant
  attr_reader :list, :average_item_value

  def initialize
    @average_item_value = 0
    @list = []
  end

  def new_item(name, rank)
    self.reset_just_stolen
    @list.push Item.new(name, rank)
    self.set_average_value
    self.show_remaining
  end

  def steal_item(item_name)
    self.reset_just_stolen
    stolen_item = @available_items.select { |item| item.name == item_name }.first
    stolen_item.steal
    self.remove_frozen_items
    self.show_remaining
  end

  def show_remaining
    puts "Name -----------------|-----Rank        Avg. Value: #{@average_item_value}"
    @available_items.each { |item| puts "#{item.name} -----|------ #{item.rank}" }
  end

  def suggest_item
    highest_rank_item = @available_items.max_by { |item| item.rank }
    if highest_rank_item.rank > @average_item_value
      puts highest_rank_item.name
    else
      puts 'Open a new present!'
    end
  end

  def reset_just_stolen
    @list.each { |item| item.just_stolen = false }
  end

  def remove_frozen_items
    @available_items = @list.select { |item| !item.frozen? }
  end

  def set_average_value
    total = 0
    @list.each do |item|
      total += item.rank
    end
    @average_item_value = total / @list.length
  end
end
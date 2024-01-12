class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        increase_quality(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage_pass_quality(item)
      when 'Sulfuras, Hand of Ragnaros'
        # Sulfuras never changes, no need to update anything
      when 'Conjured'
        degrade_quality(item, 2)
      else
        degrade_quality(item)
      end

      decrease_sell_in(item)

      if item.sell_in < 0
        handle_expired_item(item)
      end
    end
  end

  private

  def degrade_quality(item, factor = 1)
    item.quality -= factor if item.quality.positive? && item.name != 'Sulfuras, Hand of Ragnaros'
    item.quality = 0 if item.quality.negative?
  end

  def increase_quality(item, factor = 1)
    item.quality += factor if item.quality < 50
  end

  def update_backstage_pass_quality(item)
    if item.sell_in > 10
      increase_quality(item)
    elsif item.sell_in > 5
      increase_quality(item, 2)
    elsif item.sell_in >= 0
      increase_quality(item, 3)
    else
      item.quality = 0
    end
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def handle_expired_item(item)
    case item.name
    when 'Aged Brie'
      increase_quality(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      item.quality = 0
    when 'Conjured'
      degrade_quality(item, 2)
    else
      degrade_quality(item)
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

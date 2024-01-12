require 'rspec'
require File.join(File.dirname(__FILE__), 'gilded_rose')

# describe GildedRose do

#   describe "#update_quality" do
#     it "does not change the name" do
#       items = [Item.new("foo", 0, 0)]
#       GildedRose.new(items).update_quality()
#       expect(items[0].name).to eq "fixme"
#     end
#   end

# end

# require_relative 'gilded_rose'  # Adjust the file path as needed

describe GildedRose do
  describe '#update_quality' do
    it 'updates the quality for Aged Brie' do
      aged_brie = Item.new('Aged Brie', 5, 10)
      gilded_rose = GildedRose.new([aged_brie])
      gilded_rose.update_quality
      expect(aged_brie.quality).to eq(11)
    end

    it 'updates the quality for Backstage passes' do
      backstage_pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)
      gilded_rose = GildedRose.new([backstage_pass])
      gilded_rose.update_quality
      expect(backstage_pass.quality).to eq(22)
    end

    it 'does not update the quality for Sulfuras' do
      sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
      gilded_rose = GildedRose.new([sulfuras])
      gilded_rose.update_quality
      expect(sulfuras.quality).to eq(80)
    end

    it 'updates the quality for Conjured items' do
      conjured_item = Item.new('Conjured', 3, 15)
      gilded_rose = GildedRose.new([conjured_item])
      gilded_rose.update_quality
      expect(conjured_item.quality).to eq(13)
    end

    it 'updates the quality for normal items' do
      normal_item = Item.new('Normal Item', 5, 25)
      gilded_rose = GildedRose.new([normal_item])
      gilded_rose.update_quality
      expect(normal_item.quality).to eq(24)
    end

    it 'handles the expiration of Backstage passes' do
      backstage_pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 20)
      gilded_rose = GildedRose.new([backstage_pass])
      gilded_rose.update_quality
      expect(backstage_pass.quality).to eq(0)
    end

    it 'handles the expiration of Aged Brie' do
      aged_brie = Item.new('Aged Brie', 0, 10)
      gilded_rose = GildedRose.new([aged_brie])
      gilded_rose.update_quality
      expect(aged_brie.quality).to eq(12)
    end

    it 'handles the expiration of Conjured items' do
      conjured_item = Item.new('Conjured', 0, 15)
      gilded_rose = GildedRose.new([conjured_item])
      gilded_rose.update_quality
      expect(conjured_item.quality).to eq(11)
    end

    it 'handles the expiration of normal items' do
      normal_item = Item.new('Normal Item', 0, 25)
      gilded_rose = GildedRose.new([normal_item])
      gilded_rose.update_quality
      expect(normal_item.quality).to eq(23)
    end
  end
end

require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Chef") }
  subject(:dessert) { Dessert.new("creme-bulee", 100, chef)}


  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("creme-bulee")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq (100)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("creme-bulee", '1', chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to be_empty
      dessert.add_ingredient('eggs')
      expect(dessert.ingredients).to eq(['eggs'])
    end
  end

  #doesn't always get correct answer cause sometimes you can "shuffle"
  #to same ingredients
  describe "#mix!" do
    before(:each) do
      dessert.add_ingredient('eggs')
      dessert.add_ingredient('sugar')
      dessert.add_ingredient('caramel')
      dessert.add_ingredient('water')
      dessert.add_ingredient('vanilla')
    end
    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to eq(['eggs', 'sugar', 'caramel', 'water', 'vanilla'])
      dessert.mix!
      expect(dessert.ingredients).not_to eq(['eggs', 'sugar', 'caramel','water', 'vanilla'])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(100)
      dessert.eat(10)
      expect(dessert.quantity).to eq(90)
    end


    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(150) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Chef the Great Baker")
      expect(dessert.serve).to include("Chef Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end

  end
end

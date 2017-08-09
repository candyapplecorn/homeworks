require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cake) { Dessert.new("cake", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
        expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cake", "a lot", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("cyanide")
      expect(cake.ingredients).to include("cyanide")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(cake.ingredients).to receive(:shuffle!)
      cake.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      amount = cake.quantity
      cake.eat(5)
      expect(cake.quantity).to eq(amount - 5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(5_000) }.to raise_error(/not enough/)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef")
      expect(cake.serve).to match(/Chef/)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:make_more).and_return("Chef")

      chef.make_more
    end
  end
end

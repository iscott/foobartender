require 'spec_helper'

describe Drink do

 # Model & Validation Tests

  	# Test Number One
  	it "is valid when an alcohol is present, it has a price, and the over_ice and top_shelf values are set" do
  	# beer = Drink.create(alcohol: "beer", price: 5, over_ice: false, top_shelf: false)
  	# expect(beer).to be_valid
  	expect(FactoryGirl.build(:drink)).to be_valid
  	end

	# Test Number Two
 	it "is invalid without alcohol present" do
		drink = FactoryGirl.build(:drink, alcohol: nil)
	 	expect(drink).to have(1).errors_on(:alcohol)
 	end

 	# Test Number Three
 	it "is invalid without an over_ice value (true or false)" do
 		drink = FactoryGirl.build(:drink, over_ice: nil)
	 	expect(drink).to have(1).errors_on(:over_ice)
 	end

 	# Test Number Four
 	it "is invalid without a top_shelf value (true or false)" do
  		drink = FactoryGirl.build(:drink, top_shelf: nil)
	 	expect(drink).to have(1).errors_on(:top_shelf)
 	end

 	# Test Number Five
 	it "is invalid without a price" do
 		drink = FactoryGirl.build(:drink, price: nil)
	 	expect(drink).to have(2).errors_on(:price)
 	end

 	# Test Number Six
 	it "is invalid if the price is not a number" do
 		drink = FactoryGirl.build(:drink, price: "high five")
	 	expect(drink).to have(1).errors_on(:price)
 	end

 	# Test Number Seven
 	it "is invalid if the drink name (alcohol + mixer) is identical to another Drink" do
 		drink = FactoryGirl.create(:drink)
 		drink2 = FactoryGirl.build(:drink) # This one is a build, not a create, because we're just attempting to save, not saving
	 	expect(drink2).to be_invalid
 	end

 	# Test Number Eight
    it "has a price lower than $10" do
    	drink = FactoryGirl.build :drink, price: 13
    	expect(drink).to be_invalid
  	end

 # Instance Method Tests
 	describe '#drink_name' do
 		# Test Number Nine
 		it 'returns a string' do
 			drink = FactoryGirl.build(:drink)
	 		expect(drink.drink_name).to be_a(String)
 		end
 		context "when a mixer is present" do
 			# Test Number Ten
	 		it "returns a drink's full name in the format of \"[alcohol] and [mixer]\"" do
 				drink = FactoryGirl.build(:drink)
	 			expect(drink.drink_name).to eq "gin and tonic" 
	 		end
	 	end
	 	context "when there is no mixer" do
	 		# Test Number Eleven
	 		it "returns just the name of the alcohol when mixer is nil" do
 				drink = FactoryGirl.build(:drink, mixer: nil)
 				expect(drink.drink_name).to eq "gin"
	 		end
	 		# Test Number Twelve
	 		it "returns just the name of the alcohol when the mixer is an empty string" do
 				drink = FactoryGirl.build(:drink, mixer: "")
 				expect(drink.drink_name).to eq "gin"
	 		end
	 	end
 	end
 	describe '#drink_price' do
 		# Test Number Thirteen
 		it "returns the price of the drink, formatted as currency" do
 			drink = FactoryGirl.build(:drink)
 			expect(drink.drink_price).to eq "$8.00"
 		end
 	end
 	describe '#is_fancy' do
 		context "is nice booze with no water in it" do
	 		# Test Number Fourteen
	 		it "returns true if a drink is fancy" do
 			drink = FactoryGirl.build(:drink, over_ice: false)
	 		expect(drink.is_fancy).to eq true
	 		end
	 	end
	 	context "is missing key characteristics of fancy:" do
	 		# Test Number Fifteen
	 		it "is nice booze polluted with water" do
 			drink = FactoryGirl.build(:drink)
 			expect(drink.is_fancy).to eq false
	 		end
	 		# Test Number Sixteen
	 		it "is crappy booze, but at least there's no ice" do
	 		drink = FactoryGirl.build(:drink, top_shelf: false, over_ice: false)	
			expect(drink.is_fancy).to eq false	 		
			end
	 	end
 	end
end

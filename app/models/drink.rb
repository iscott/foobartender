class Drink < ActiveRecord::Base

	validates :alcohol, presence: :true
	validates_uniqueness_of :alcohol, :scope => [:mixer]

	validates :over_ice, :inclusion => {:in => [true, false]}

	validates :top_shelf, :inclusion => {:in => [true, false]}

	validates :price, presence: :true, numericality: {
									    less_than_or_equal_to: 10
									  }

	def drink_name
		if mixer == nil || mixer == "" # just the first half of this (up to or) for 1st test
			"#{alcohol}"
		else
			"#{alcohol} and #{mixer}"
		end
	end

	def drink_price
		"$#{price}.00"
	end

	def is_fancy
		if over_ice == false && top_shelf == true
			true
		else
			false
		end
	end

end

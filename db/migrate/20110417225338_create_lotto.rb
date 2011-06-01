class CreateLotto < ActiveRecord::Migration
  def self.up
  create_table :combinations do |t|
	t.integer :n1
	t.integer :n2
	t.integer :n3
	t.integer :n4
	t.integer :n5
	t.integer :sum
	t.integer :no_of_even
	t.integer :no_of_odd
	t.integer :no_end_0
	t.integer :no_end_1
	t.integer :no_end_2
	t.integer :no_end_3
	t.integer :no_end_4
	t.integer :no_end_5
	t.integer :no_end_6
	t.integer :no_end_7
	t.integer :no_end_8
	t.integer :no_end_9
	t.integer :d2
	t.integer :d3
	t.integer :d4
	t.integer :d5
	t.integer :d6
	t.integer :d7
	t.integer :d8
	t.integer :d9
	t.integer :set_prime
	t.integer :set_1_21 
	t.integer :set_22_42
	t.integer :set_1_7
	t.integer :set_8_14 
	t.integer :set_15_21
	t.integer :set_22_28
	t.integer :set_29_36
	t.integer :set_37_42
	t.integer :set_up
	t.integer :set_down 
	t.integer :set_left 
	t.integer :set_right
	t.integer :set_1_9
	t.integer :set_10_19
	t.integer :set_20_29
	t.integer :set_30_39
	t.integer :set_40_42
  end
  
    create_table :results do |t|
	t.integer :no
	t.integer :n1
	t.integer :n2
	t.integer :n3
	t.integer :n4
	t.integer :n5
	t.integer :sum
	t.integer :no_of_even
	t.integer :no_of_odd
	t.integer :no_end_0
	t.integer :no_end_1
	t.integer :no_end_2
	t.integer :no_end_3
	t.integer :no_end_4
	t.integer :no_end_5
	t.integer :no_end_6
	t.integer :no_end_7
	t.integer :no_end_8
	t.integer :no_end_9
	t.integer :d2
	t.integer :d3
	t.integer :d4
	t.integer :d5
	t.integer :d6
	t.integer :d7
	t.integer :d8
	t.integer :d9
	t.integer :set_prime
	t.integer :set_1_21 
	t.integer :set_22_42
	t.integer :set_1_7
	t.integer :set_8_14 
	t.integer :set_15_21
	t.integer :set_22_28
	t.integer :set_29_36
	t.integer :set_37_42
	t.integer :set_up
	t.integer :set_down 
	t.integer :set_left 
	t.integer :set_right
	t.integer :set_1_9
	t.integer :set_10_19
	t.integer :set_20_29
	t.integer :set_30_39
	t.integer :set_40_42
	t.date :date
  end
  
  end

  def self.down
	drop_table :combinations
	drop_table :results
  end
end
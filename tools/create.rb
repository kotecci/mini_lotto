#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/boot'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")


def combine
  numbers = Array.new(42) {|i| i+1}
  combinations = numbers.combination(5)
  combinations.each_with_index do |c, idx|
  next if idx < 500000
	puts idx
	#break if idx == 500000
    stats = stat_combination(c)
    m = Combination.new(:n1 => c[0], :n2 => c[1], :n3 => c[2], :n4 => c[3], :n5 => c[4],
      :sum => stats[:sum], :no_of_even => stats[:no_of_even], :no_of_odd => stats[:no_of_odd],
	  :no_end_0 => stats[:no_end_0],
	  :no_end_1 => stats[:no_end_1],
	  :no_end_2 => stats[:no_end_2],
	  :no_end_3 => stats[:no_end_3],
	  :no_end_4 => stats[:no_end_4],
	  :no_end_5 => stats[:no_end_5],
	  :no_end_6 => stats[:no_end_6],
	  :no_end_7 => stats[:no_end_7],
	  :no_end_8 => stats[:no_end_8],
	  :no_end_9 => stats[:no_end_9],
	  :d2 => stats[:d2],
	  :d3 => stats[:d3],
	  :d4 => stats[:d4],
	  :d5 => stats[:d5],
	  :d6 => stats[:d6],
	  :d7 => stats[:d7],
	  :d8 => stats[:d8],
	  :d9 => stats[:d9],
	  :set_prime => stats[:set_prime],
	  :set_1_21 => stats[:set_1_21],
	  :set_22_42 => stats[:set_22_42],
	  :set_1_7 => stats[:set_1_7],
	  :set_8_14 => stats[:set_8_14],
	  :set_15_21 => stats[:set_15_21],
	  :set_22_28 => stats[:set_22_28],
	  :set_29_36 => stats[:set_29_36],
	  :set_37_42 => stats[:set_37_42],
	  :set_1_9 => stats[:set_1_9],
	  :set_10_19 => stats[:set_10_19],
	  :set_20_29 => stats[:set_20_29],
	  :set_30_39 => stats[:set_30_39],
	  :set_40_42 => stats[:set_40_42]
    )
	m.set_up = stats[:set_up]
	m.set_down = stats[:set_down]
	m.set_left = stats[:set_left]
	m.set_right = stats[:set_right]
    m.save
    #end
  end
end

def stat_combination(c)
  stats = {
	:sum => c.inject{|sum,x| sum + x },
    :no_of_even => 0, :no_of_odd => 0,
    :no_end_0 => 0, :no_end_1 => 0, :no_end_2 => 0, :no_end_3 => 0, :no_end_4 => 0, :no_end_5 => 0,
    :no_end_6 => 0, :no_end_7 => 0, :no_end_8 => 0, :no_end_9 => 0, :sum => 0, 
	:set_up => 0, :set_down => 0, :set_left => 0, :set_right => 0,
	:set_1_21 => 0, :set_22_42 => 0, :set_1_7 => 0, :set_8_14 => 0, :set_15_21 => 0,  :set_22_28 => 0,
	:set_29_36 => 0, :set_37_42 => 0,
	:set_prime => 0,
	:set_1_9 => 0, :set_10_19 => 0, :set_20_29 => 0, :set_30_39 => 0, :set_40_42 => 0,
	:d2 => 0, :d3 => 0, :d4 => 0, :d5 => 0, :d6 => 0, :d7 => 0, :d8 => 0, :d9 => 0,
		:set_a => 0, :set_b => 0, :set_c  => 0,	:set_d  => 0,
	:set_s  => 0, :set_t  => 0,	:set_u  => 0, :set_w  => 0,
	:set_x  => 0, :set_y  => 0,	:set_z  => 0
	
  }
  
  set_up = [1, 2, 3, 4, 8, 9, 10, 11, 15, 16, 17, 18, 22, 23, 24, 25, 29, 30, 31, 32, 36, 37, 38, 39]
  set_down = [5, 6, 7, 12, 13, 14, 19, 20, 21, 26, 27, 28, 33, 34, 35, 40, 41, 42]
  set_left = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
  set_right = [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42]
  
  set_1_21 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
  set_22_42 = [22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42]
  set_1_7 = [1, 2, 3, 4, 5, 6, 7]
  set_8_14 = [8, 9, 10, 11, 12, 13, 14]
  set_15_21 = [15, 16, 17, 18, 19, 20, 21]
  set_22_28 = [22, 23, 24, 25, 26, 27, 28]
  set_29_36 = [29, 30, 31, 32, 33, 34, 35]
  set_37_42 = [36, 37, 38, 39, 40, 41, 42]
  set_prime = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41]
  set_1_9 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  set_10_19 = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  set_20_29 = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
  set_30_39 = [30, 31, 32, 33, 34, 35, 36, 37, 38, 39]
  set_40_42 = [40, 41, 42]
  
  	set_a = [1,2,3,4,8,9,10,11,15,16,17,18]
	set_b = [22,23,24,29,30,31,36,37,38]
	set_c = [5,6,7,12,13,14,19,20,21]
	set_d = [25,26,27,28,32,33,34,35,39,40,41,42]
	
	set_s = [1,8,15,22,29,36]
	set_t = [2,9,16,23,30,37]
	set_u = [3,10,17,24,31,38]
	set_w = [4,11,18,25,32,39]
	set_x = [5,12,19,26,33,40]
	set_y = [6,13,20,27,34,41]
	set_z = [7,14,21,28,35,42]
  
  
  
  c.each do |n|
    n = n.to_i
    n%2 == 0 ? (stats[:no_of_even] += 1) : (stats[:no_of_odd] +=1)
    stats[:sum] += n.to_i
	stats[:set_up] += 1 if set_up.include?(n)
	stats[:set_down] += 1 if set_down.include?(n)
	stats[:set_left] += 1 if set_left.include?(n)
	stats[:set_right] += 1 if set_right.include?(n)
	
	stats[:set_1_21] += 1 if set_1_21.include?(n)
	stats[:set_22_42] += 1 if set_22_42.include?(n)
	stats[:set_1_7] += 1 if set_1_7.include?(n)
	stats[:set_8_14] += 1 if set_8_14.include?(n)
	stats[:set_15_21] += 1 if set_15_21.include?(n)
	stats[:set_22_28] += 1 if set_22_28.include?(n)
	stats[:set_29_36] += 1 if set_29_36.include?(n)
	stats[:set_37_42] += 1 if set_37_42.include?(n)
	stats[:set_prime] += 1 if set_prime.include?(n)
	
	stats[:set_1_9] += 1 if set_1_9.include?(n)
	stats[:set_10_19] += 1 if set_10_19.include?(n)
	stats[:set_20_29] += 1 if set_20_29.include?(n)
	stats[:set_30_39] += 1 if set_30_39.include?(n)
	stats[:set_40_42] += 1 if set_40_42.include?(n)
	
	stats[:d2] += 1 if n%2 == 0
	stats[:d3] += 1 if n%3 == 0
	stats[:d4] += 1 if n%4 == 0
	stats[:d5] += 1 if n%5 == 0
	stats[:d6] += 1 if n%6 == 0
	stats[:d7] += 1 if n%7 == 0
	stats[:d8] += 1 if n%8 == 0
	stats[:d9] += 1 if n%9 == 0
	
	stats[:set_a] += 1 if set_a.include?(n)
	stats[:set_b] += 1 if set_b.include?(n)
	stats[:set_c] += 1 if set_c.include?(n)
	stats[:set_d] += 1 if set_d.include?(n)
	
	stats[:set_s] += 1 if set_s.include?(n)
	stats[:set_t] += 1 if set_t.include?(n)
	stats[:set_u] += 1 if set_u.include?(n)
	stats[:set_w] += 1 if set_w.include?(n)
	stats[:set_x] += 1 if set_x.include?(n)
	stats[:set_y] += 1 if set_y.include?(n)
	stats[:set_z] += 1 if set_z.include?(n)
	
	
    last_digit = n.to_s.last
    stats["no_end_#{last_digit}".to_sym] += 1
  end
  stats
end

def parse_results
	File.open("wyniki.txt").each do |line|
		arr = line.split("\t")
    numbers = arr[2].split
    arr.delete_at(2)
    arr = arr + numbers

		combination = [arr[2], arr[3], arr[4], arr[5], arr[6].gsub(/\r\n/,'')]
		stats = stat_combination(combination)
		r= Result.create(:no => arr[0], :date => arr[1],
		:n1 => combination[0], :n2 => combination[1], :n3 => combination[2], :n4 => combination[3], :n5 => combination[4],
		      :sum => stats[:sum], :no_of_even => stats[:no_of_even], :no_of_odd => stats[:no_of_odd],
	  :no_end_0 => stats[:no_end_0],
	  :no_end_1 => stats[:no_end_1],
	  :no_end_2 => stats[:no_end_2],
	  :no_end_3 => stats[:no_end_3],
	  :no_end_4 => stats[:no_end_4],
	  :no_end_5 => stats[:no_end_5],
	  :no_end_6 => stats[:no_end_6],
	  :no_end_7 => stats[:no_end_7],
	  :no_end_8 => stats[:no_end_8],
	  :no_end_9 => stats[:no_end_9],
	  :d2 => stats[:d2],
	  :d3 => stats[:d3],
	  :d4 => stats[:d4],
	  :d5 => stats[:d5],
	  :d6 => stats[:d6],
	  :d7 => stats[:d7],
	  :d8 => stats[:d8],
	  :d9 => stats[:d9],
	  :set_up => stats[:set_up],
	  :set_down => stats[:set_down],
	  :set_left => stats[:set_left],
	  :set_right => stats[:set_right],
	  :set_prime => stats[:set_prime],
	  :set_1_21 => stats[:set_1_21],
	  :set_22_42 => stats[:set_22_42],
	  :set_1_7 => stats[:set_1_7],
	  :set_8_14 => stats[:set_8_14],
	  :set_15_21 => stats[:set_15_21],
	  :set_22_28 => stats[:set_22_28],
	  :set_29_36 => stats[:set_29_36],
	  :set_37_42 => stats[:set_37_42],
	  :set_1_9 => stats[:set_1_9],
	  :set_10_19 => stats[:set_10_19],
	  :set_20_29 => stats[:set_20_29],
	  :set_30_39 => stats[:set_30_39],
	  :set_40_42 => stats[:set_40_42],
	  :set_a => stats[:set_a],
	  :set_b => stats[:set_b],
	  :set_c => stats[:set_c],
	  :set_d => stats[:set_d],
	 :set_s => stats[:set_s],
	 :set_t => stats[:set_t],
	 :set_u =>stats[:set_u],
	 :set_w => stats[:set_w],
	 :set_x => stats[:set_x],
	 :set_y => stats[:set_y],
	 :set_z => stats[:set_z]
	  )
	  puts r.no
	end
end

def add_rare	
	Result.all(:conditions => 'rares.result_id IS NULL', :include => :rare).each do |r|
		rare = Rare.new
		(1..42).each do |rr|
			w = r.how_many_last_occurance(rr)
			rare.send("r#{rr}=", w[0])
			rare.send("sum_r#{rr}=", w[1])
			rare.result_id = r.id
		end
		
		rare.save
		
		puts rare.id
		#r.rare_id = rare.id
		#r.save
	end
end

def most_often	
	Result.all(:conditions => 'most_oftens.result_id IS NULL', :include => :most_often).each do |r|
		mo = MostOften.new
		(1..42).each do |rr|
			w = r.how_many_most_often(rr)
			mo.send("m#{rr}=", w[0])
			mo.send("sum_m#{rr}=", w[1])
			mo.result_id = r.id
		end
		
		mo.save
		
		puts mo.id
		#r.rare_id = rare.id
		#r.save
	end
end

def most_brak
	Result.all(:conditions => 'most_breaks.result_id IS NULL AND results.no > 2000', :include => :most_break).each do |r|
		mo = MostBreak.new
		(1..42).each do |rr|
		puts "a"
			w = r.how_many_most_break(rr)
			#puts rr
			mo.send("m#{rr}=", w[0])
			mo.send("sum_m#{rr}=", w[1])
			mo.result_id = r.id
		end
		
		mo.save
		
		puts mo.id
		#r.rare_id = rare.id
		#r.save
	end
end

def add_combination_new_sets
	set_a = [1,2,3,4,8,9,10,11,15,16,17,18]
	set_b = [22,23,24,29,30,31,36,37,38]
	set_c = [5,6,7,12,13,14,19,20,21]
	set_d = [25,26,27,28,32,33,34,35,39,40,41,42]
	
	set_s = [1,8,15,22,29,36]
	set_t = [2,9,16,23,30,37]
	set_u = [3,10,17,24,31,38]
	set_w = [4,11,18,25,32,39]
	set_x = [5,12,19,26,33,40]
	set_y = [6,13,20,27,34,41]
	set_z = [7,14,21,28,35,42]

	Combination.all(:conditions => 'set_a IS NULL and id < 470000').each do |r|
		puts r.id
		stats = {
		:set_a => 0, :set_b => 0, :set_c  => 0,	:set_d  => 0,
		:set_s  => 0, :set_t  => 0,	:set_u  => 0, :set_w  => 0,
		:set_x  => 0, :set_y  => 0,	:set_z  => 0
		}
		
		combination = [r.n1, r.n2, r.n3, r.n4, r.n5]
		combination.each do |n|
		stats[:set_a] += 1 if set_a.include?(n)
		stats[:set_b] += 1 if set_b.include?(n)
		stats[:set_c] += 1 if set_c.include?(n)
		stats[:set_d] += 1 if set_d.include?(n)
		
		stats[:set_s] += 1 if set_s.include?(n)
		stats[:set_t] += 1 if set_t.include?(n)
		stats[:set_u] += 1 if set_u.include?(n)
		stats[:set_w] += 1 if set_w.include?(n)
		stats[:set_x] += 1 if set_x.include?(n)
		stats[:set_y] += 1 if set_y.include?(n)
		stats[:set_z] += 1 if set_z.include?(n)
		end
		r.set_a = stats[:set_a]
		r.set_b = stats[:set_b]
		r.set_c = stats[:set_c]
		r.set_d = stats[:set_d]
		
		r.set_s = stats[:set_s]
		r.set_t = stats[:set_t]
		r.set_u = stats[:set_u]
		r.set_w = stats[:set_w]
		r.set_x = stats[:set_x]
		r.set_y = stats[:set_y]
		r.set_z = stats[:set_z]
		r.save
	end
end


start = Time.now
puts Time.now
#puts "All combinations count: #{Combination.count}"
#combine
#parse_results
#add_rare
#most_often
add_combination_new_sets
#most_brak
puts Time.now - start

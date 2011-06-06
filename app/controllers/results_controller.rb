class ResultsController < ApplicationController
  def index
    #conditions = 'no >= 2485 AND no <= 2495'
	conditions = ' no >= 2000'
    @results = Result.all(:conditions => conditions, :order => 'no DESC')

  end

  def create
    #respond_to do |format|
    arr = []
    params.each do |k, v|
      next if v == '' || k == 'commit' || k == 'authenticity_token' ||
        k == 'utf8' || k == 'action' || k == 'controller'
      arr << "#{k} > #{v}" && next if ['no'].include?(k)
      arr << "#{k} = #{v}" && next if ['set_up','set_down'].include?(k)
      arr << "#{k} < #{v}" && next if ['d2','d3','d4','d5','d6','d7','d8','d9',
        'no_end_0', 'no_end_1', 'no_end_2',	'no_end_3',	'no_end_4',	'no_end_5',	'no_end_6',	'no_end_7',	'no_end_8',	'no_end_9',
        'no_of_even', 'no_of_odd',
        'set_1_7','set_8_14', 'set_15_21','set_22_28','set_29_36','set_37_42',
        'set_1_9','set_10_19','set_20_29','set_30_39','set_40_42',
        'set_1_21','set_22_42', 'set_left', 'set_right'
      ].include?(k)
      #arr << "#{k} >= #{v}" if v != '' && (k == 'no' || k == 'set_1_21' || k == 'set_22_42')
    end

    conditions = arr.join(' AND ')
    conditions += ' AND sum BETWEEN 50 AND 165'
    #arr.delete_if()
    arr.delete_if {|e| e.match('no >')}
    
    conditions2 = arr.join(' AND ')
    conditions2 += ' AND sum BETWEEN 50 AND 165 '

    all_count = Result.count(:conditions => ['set_up = ? AND no > ?', params[:set_up], params[:no]])
    conditions += 'AND NOT (
      (n1 = (n2-1) AND n2 = (n3-1)) OR
      (n2 = (n3-1) AND n3 = (n4-1)) OR
      (n3 = (n4-1) AND n4 = (n5-1)) OR
      (n1 = (n2-1) AND n4 = (n5-1)) OR
      (n2 = (n3-1) AND n4 = (n5-1)) OR
      (n1 = (n2-1) AND n3 = (n4-1))
      ) AND set_a <4 and set_b<4 and set_c <4'

    conditions2 += ' AND NOT (
      (n1 = (n2-1) AND n2 = (n3-1)) OR
      (n2 = (n3-1) AND n3 = (n4-1)) OR
      (n3 = (n4-1) AND n4 = (n5-1)) OR
      (n1 = (n2-1) AND n4 = (n5-1)) OR
      (n2 = (n3-1) AND n4 = (n5-1)) OR
      (n1 = (n2-1) AND n3 = (n4-1))
    )'
    #1,2,7,41,42
    #1,3,4,7,8
    #1,2,7,8,41

    #conditions2 += ' AND n1=2 AND n2=9 AND n3=15 AND n4 = 37 AND n5 = 40 '
    #conditions2 += ' AND n1=1 AND n2=2 AND n3=4 AND n4 = 29 AND n5 = 33 '
    #conditions2 += ' AND n1=3 AND n2=5 AND n3=18 AND n4 = 25 AND n5 = 27 '
    #conditions2 += ' AND n1=3 AND n2=10 AND n3=16 AND n4 = 19 AND n5 = 42 '
    #conditions2 += ' AND n1=8 AND n2=12 AND n3=25 AND n4 = 32 AND n5 = 37 '
    #conditions2 += ' AND n1=1 AND n2=9 AND n3=29 AND n4 = 36 AND n5 = 40 '
	#conditions2 += ' AND n1=6 AND n2=7 AND n3=16 AND n4 = 26 AND n5 = 27 '
	#conditions2 += ' AND n1=8 AND n2=15 AND n3=22 AND n4 = 38 AND n5 = 40 '
	#conditions2 += ' AND n1=2 AND n2=8 AND n3=17 AND n4 = 28 AND n5 = 39 '

    #conditions2 += no_pairs(most_break(10))
    #p no_pairs(most_break(10))
	conditions += ' AND n1 < 22 AND n2 < 34 AND n5 > 24'  #18
	conditions2 += ' AND n1 < 22 AND n2 < 34 AND n5 > 24'
		
    r = Result.count(:conditions => conditions)
	draw_no = 2539
    lr = Result.find_by_no(draw_no)
    lra = no_pairs([lr.n1, lr.n2, lr.n3, lr.n4, lr.n5])

    #conditions2 += lra #+ no_pairs([20, 39]) + no_pairs([10, 34]) + no_pairs([18, 38]) + no_pairs([26, 30]) + no_pairs([26, 29]) + no_pairs([15, 39]) + no_pairs([31, 34])
    #conditions2 += no_pairs(most_break(5))
	#the most break
    #a = most_break(9)
	
    #conditions2 += no_triple(a)
	
	#the lowest occurance in last 100 draws
	a = count_occurance(23,draw_no)
	conditions2 += no_fives(a)
	a = count_occurance(26,draw_no)
	conditions2 += has_set(a)
	a = count_occurance(12,draw_no)
	conditions2 += no_fours(a)
	a = count_occurance(40,draw_no)
	conditions2 += has_four(a)
	a = count_occurance(6,draw_no)
	conditions2 += no_triple(a)
	a = count_occurance(3,draw_no)
	conditions2 += no_pairs(a)
	a = count_occurance(35,draw_no)
	conditions2 += has_pair(a)
	a = count_occurance(36,draw_no)
	conditions2 += has_triple(a)
	
	a = count_most_often(19,draw_no)
	conditions2 += has_set(a)
	a = count_most_often(16,draw_no)
	conditions2 += no_fives(a)
	a = count_most_often(10,draw_no)
	conditions2 += no_fours(a)
	a = count_most_often(29,draw_no)
	conditions2 += has_pair(a)
	a = count_most_often(38,draw_no)
	conditions2 += has_four(a)
	a = count_most_often(3,draw_no)
	conditions2 += no_triple(a)
	a = count_most_often(2,draw_no)
	conditions2 += no_pairs(a)
	a = count_most_often(36,draw_no)
	conditions2 += has_triple(a)
	
	a = most_break(24,draw_no)
	conditions2 += has_set(a)
	a = most_break(19,draw_no)
	conditions2 += no_fives(a)
	a = most_break(7,draw_no)
	conditions2 += no_fours(a)
	a = most_break(4,draw_no)
	conditions2 += no_triple(a)
	a = most_break(2,draw_no)
	conditions2 += no_pairs(a)
	a = most_break(35,draw_no)
	conditions2 += has_pair(a)
	a = most_break(39,draw_no)
	conditions2 += has_triple(a)
	a = most_break(40,draw_no)
	conditions2 += has_four(a)
	
	#old_results = Result.all(:select => 'n1, n2, n3, n4, n5', :conditions => 'no <10000').each do |r|
	#	conditions2 += no_fives([r.n1, r.n2, r.n3, r.n4, r.n5])
	#end
	
	a = lr.numbers_in_last(7)
	conditions2 += has_set(a)
	a = lr.numbers_in_last(14)
	conditions2 += has_pair(a)
	a = lr.numbers_in_last(18)	
	conditions2 += has_triple(a)
	a =  lr.numbers_in_last(3)
	conditions2 += no_fives(a)
	

	#-10 plus
	a = lr.numbers_in_last_and_add(18,-10)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,-10)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,-10)
	conditions2 += no_fours(a)
	
	#-9 plus
	a = lr.numbers_in_last_and_add(17,-9)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(4,-9)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,-9)
	conditions2 += no_fours(a)
	
	#-8 plus
	a = lr.numbers_in_last_and_add(21,-8)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,-8)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,-8)
	conditions2 += no_fours(a)
	
	#-7 plus
	a = lr.numbers_in_last_and_add(15,-7)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(4,-7)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,-7)
	conditions2 += no_fours(a)
	a = lr.numbers_in_last_and_add(28,-7)
	conditions2 += has_pair(a)
	
	#-6 plus
	a = lr.numbers_in_last_and_add(13,-6)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,-6)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,-6)
	conditions2 += no_fours(a)
	a = lr.numbers_in_last_and_add(31,-6)
	conditions2 += has_pair(a)
	
	#-5 plus
	a = lr.numbers_in_last_and_add(13,-5)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(19,-5)
	conditions2 += has_pair(a)
	a = lr.numbers_in_last_and_add(30,-5)
	conditions2 += has_triple(a)
	a = lr.numbers_in_last_and_add(3,-5)
	conditions2 += no_fives(a)
	
	#-4 plus
	a = lr.numbers_in_last_and_add(12,-4)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(23,-4)
	conditions2 += has_pair(a)
	#a = lr.numbers_in_last_and_add(30,-3)
	#conditions2 += has_triple(a)
	a = lr.numbers_in_last_and_add(2,-4)
	conditions2 += no_fives(a)
	
	#-3 plus
	a = lr.numbers_in_last_and_add(13,-3)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(23,-3)
	conditions2 += has_pair(a)
	#a = lr.numbers_in_last_and_add(30,-3)
	#conditions2 += has_triple(a)
	a = lr.numbers_in_last_and_add(4,-3)
	conditions2 += no_fives(a)
		
	
	#-2 plus
	a = lr.numbers_in_last_and_add(11,-2)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,-2)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,-2)
	conditions2 += no_fours(a)
	a = lr.numbers_in_last_and_add(28,-2)
	conditions2 += has_triple(a)	
		
	#-1 plus
	a = lr.numbers_in_last_and_add(10,-1)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(14,-1)
	conditions2 += has_pair(a)
	a = lr.numbers_in_last_and_add(26,-1)
	conditions2 += has_triple(a)
	#a = lr.numbers_in_last_and_add(35,-1) #check
	#conditions2 += has_four(a)
	a = lr.numbers_in_last_and_add(2,-1)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,-1)
	conditions2 += no_fours(a)
	


	
	#1 plus
	a = lr.numbers_in_last_and_add(13,1)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(14,1)
	conditions2 += has_pair(a)
	a = lr.numbers_in_last_and_add(23,1)
	conditions2 += has_triple(a)
	#a = lr.numbers_in_last_and_add(35,1) #check
	#conditions2 += has_four(a)
	a = lr.numbers_in_last_and_add(2,1)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,1)
	conditions2 += no_fours(a)
	
	#2 plus
	a = lr.numbers_in_last_and_add(10,2)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,2)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,2)
	conditions2 += no_fours(a)
	a = lr.numbers_in_last_and_add(27,2)
	conditions2 += has_triple(a)
	a = lr.numbers_in_last_and_add(20,2)
	conditions2 += has_pair(a)
	
	
	#3 plus
	a = lr.numbers_in_last_and_add(14,3)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,3)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,3)
	conditions2 += no_fours(a)
	a = lr.numbers_in_last_and_add(28,3)
	conditions2 += has_triple(a)
	#a = lr.numbers_in_last_and_add(35,3)
	#conditions2 += has_pair(a)
	
	#4 plus
	a = lr.numbers_in_last_and_add(13,4)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,4)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,4)
	conditions2 += no_fours(a)
	a = lr.numbers_in_last_and_add(29,4)
	conditions2 += has_pair(a)
	
	#5 plus
	a = lr.numbers_in_last_and_add(13,5)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(22,5)
	conditions2 += has_pair(a)
	a = lr.numbers_in_last_and_add(30,5)
	conditions2 += has_triple(a)
	a = lr.numbers_in_last_and_add(2,5)
	conditions2 += no_fives(a)
	
	
	#6 plus
	a = lr.numbers_in_last_and_add(15,6)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,6)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,6)
	conditions2 += no_fours(a)
	#a = lr.numbers_in_last_and_add(29,6)
	#conditions2 += has_pair(a)
	
	#7 plus
	a = lr.numbers_in_last_and_add(20,7)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(2,7)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,7)
	conditions2 += no_fours(a)
	#a = lr.numbers_in_last_and_add(29,6)
	#conditions2 += has_pair(a)
	
	#8 plus
	a = lr.numbers_in_last_and_add(15,8)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(4,8)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(2,8)
	conditions2 += no_fours(a)
	#a = lr.numbers_in_last_and_add(29,6)
	#conditions2 += has_pair(a)
	
	#9 plus
	a = lr.numbers_in_last_and_add(18,9)
	conditions2 += has_set(a)
	a = lr.numbers_in_last_and_add(3,9)
	conditions2 += no_fives(a)
	a = lr.numbers_in_last_and_add(1,9)
	conditions2 += no_fours(a)
	#a = lr.numbers_in_last_and_add(29,6)
	#conditions2 += has_pair(a)
	
	
	
	

    c = Combination.count(:conditions => conditions2)
    #w = Combination.all(:conditions => conditions2, :order => 'id ASC', :limit => 10)
    #w = Combination.all(:conditions => conditions2, :order => 'id ASC', :limit => 10)

    i=1

	myfile = File.new("kombinacje.txt", "w+")
    Combination.all(:conditions => conditions2, :order => 'id ASC').each do |v|
		myfile.puts("#{i}: #{v.n1} - #{v.n2} - #{v.n3} - #{v.n4} - #{v.n5}")
		i+=1;
	end

	
    #randed = ww.map { |v| i+=1;"<br>#{i}: #{v.n1} - #{v.n2} - #{v.n3} - #{v.n4} - #{v.n5}"  }
    #w = c.map {|t| "#{t.n1} - #{t.n2} - #{t.n3} - #{t.n4} - #{t.n5} ||||"}

    #p no_pairs(most_break(10))
    render :text => "ALL: #{all_count} - R: #{r} #{} #{}, C: #{c}, <br> #{}"
    #end
  end

  def has_set(array)
	lrj = array.join(',')
	return " AND (
	n1 IN (#{lrj}) OR n2 IN (#{lrj}) OR n3 IN (#{lrj}) OR n4 IN (#{lrj}) OR n5 IN (#{lrj}) 
	)"
  end
  
  def count_occurance(c, n=nil)
	numbers = {}
	sorted = []
	(1..42).to_a.each do |e|
		conditions = "(n1 = #{e} OR n2 = #{e} OR n3 = #{e} OR n4 = #{e} OR n5 = #{e})"
		conditions += " AND (no >= #{n-100})" #if !n.nil?
		r = Result.count(:conditions => conditions, 
        :order =>'no DESC')
        numbers[e] = r
	end
	numbers.sort_by{|k,v| v}.each{|e| sorted << e[0]}
	while numbers[c] == numbers[c+1]
		c += 1
	end
    return sorted[0..c-1]
  end
  
    def count_most_often(c, n=nil)
	numbers = {}
	sorted = []
	(1..42).to_a.each do |e|
		conditions = "(n1 = #{e} OR n2 = #{e} OR n3 = #{e} OR n4 = #{e} OR n5 = #{e})"
		conditions += " AND (no >= #{n-100})" #if !n.nil?
		r = Result.count(:conditions => conditions, 
        :order =>'no DESC')
        numbers[e] = r
	end
	numbers.sort_by{|k,v| v}.reverse.each{|e| sorted << e[0]}
	while numbers[c] == numbers[c+1]
		c += 1
	end
    return sorted[0..c-1]
  end
  
  
  def most_break(c, to=nil)
    numbers = {}
    sorted =[]
    (1..42).to_a.each do |e|
		conditions = "(n1 = #{e} OR n2 = #{e} OR n3 = #{e} OR n4 = #{e} OR n5 = #{e})"
		conditions += " AND (no < #{to})" if !to.nil?
		r = Result.all(:conditions => conditions, 
        :order =>'no DESC')
		date = r.first.date #if !r.empty?
        numbers[e] = date
    end
    numbers.sort_by{|k,v| v}.each{|e| sorted << e[0]}
	while numbers[c] == numbers[c+1]
		c += 1
	end
    return sorted[0..c-1]
  end

  def no_pairs(array)
    lrj = array.join(',')
    return "AND NOT
(
	(n1 IN (#{lrj}) AND (n2 IN (#{lrj}) OR n3 IN (#{lrj}) OR n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
    (n2 IN (#{lrj}) AND (n3 IN (#{lrj}) OR n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
    (n3 IN (#{lrj}) AND (n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
    (n4 IN (#{lrj}) AND (n5 IN (#{lrj})))
)"
  end
  
  def has_pair(array)
    lrj = array.join(',')
    return "AND
(
	(n1 IN (#{lrj}) AND (n2 IN (#{lrj}) OR n3 IN (#{lrj}) OR n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
    (n2 IN (#{lrj}) AND (n3 IN (#{lrj}) OR n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
    (n3 IN (#{lrj}) AND (n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
    (n4 IN (#{lrj}) AND (n5 IN (#{lrj})))
)"
  end
  
  
  def no_triple(array)
      lrj = array.join(',')
    return "AND NOT
(
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND (n3 IN (#{lrj}) OR n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n1 IN (#{lrj}) AND n3 IN (#{lrj}) AND ( n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n1 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj})) OR

	(n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND (n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n2 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj})) OR
	(n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj}))
)"
  end
  
    def has_triple(array)
      lrj = array.join(',')
    return "AND
(
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND (n3 IN (#{lrj}) OR n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n1 IN (#{lrj}) AND n3 IN (#{lrj}) AND ( n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n1 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj})) OR

	(n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND (n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n2 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj})) OR
	(n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj}))
)"
  end
  
   def no_fours(array)
      lrj = array.join(',')
    return "AND NOT
(
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND (n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND n4 IN (#{lrj}) AND ( n5 IN (#{lrj}))) OR
	(n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj}))
)"
  end
  
   def has_four(array)
      lrj = array.join(',')
    return "AND
(
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND (n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND n4 IN (#{lrj}) AND ( n5 IN (#{lrj}))) OR
	(n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj}))
)"
  end
  
  def no_fives(array)
      lrj = array.join(',')
    return "AND NOT
(
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND (n5 IN (#{lrj})))
)"
  end

  def no_number(n)
    return "AND (n1 <> #{n} AND n2<> #{n} AND n3 <> #{n} AND n4 <> #{n} AND n5 <> #{n})"
  end

end
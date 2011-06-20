class ResultsController < ApplicationController
  def index
    #conditions = 'no >= 2485 AND no <= 2495'
    conditions = ' no >= 2400'
    @results = Result.all(:conditions => conditions, :include => :most_break, :order => 'no DESC')

  end

  def create
    #respond_to do |format|
    arr = []
    draw_no = 2548
    
    params.each do |k, v|
      next if v == '' || k == 'commit' || k == 'authenticity_token' ||
        k == 'utf8' || k == 'action' || k == 'controller'
      arr << "#{k} > #{v}" && next if ['no'].include?(k)
      arr << "sum >= #{v}" && next if ['sum_min'].include?(k)
      arr << "sum <= #{v}" && next if ['sum_max'].include?(k)
      arr << "set_a >= #{v}" && next if [ 'set_a_min'].include?(k)
      arr << "set_a <= #{v}" && next if [ 'set_a_max'].include?(k)

      arr << "set_b >= #{v}" && next if [ 'set_b_min'].include?(k)
      arr << "set_b <= #{v}" && next if [ 'set_b_max'].include?(k)

      arr << "set_c >= #{v}" && next if [ 'set_c_min'].include?(k)
      arr << "set_c <= #{v}" && next if [ 'set_c_max'].include?(k)

      arr << "set_d >= #{v}" && next if [ 'set_d_min'].include?(k)
      arr << "set_d <= #{v}" && next if [ 'set_d_max'].include?(k)

      arr << "set_1_21 >= #{v}" && next if [ 'set_1_21_min'].include?(k)
      arr << "set_1_21 <= #{v}" && next if [ 'set_1_21_max'].include?(k)

      arr << "set_22_42 >= #{v}" && next if [ 'set_22_42_min'].include?(k)
      arr << "set_22_42 <= #{v}" && next if [ 'set_22_42_max'].include?(k)


      arr << "set_1_14 >= #{v}" && next if [ 'set_1_14_min'].include?(k)
      arr << "set_1_14 <= #{v}" && next if [ 'set_1_14_max'].include?(k)

      arr << "set_15_28 >= #{v}" && next if [ 'set_15_28_min'].include?(k)
      arr << "set_15_28 <= #{v}" && next if [ 'set_15_28_max'].include?(k)

      arr << "set_29_42 >= #{v}" && next if [ 'set_29_42_min'].include?(k)
      arr << "set_29_42 <= #{v}" && next if [ 'set_29_42_max'].include?(k)

      arr << "set_1_7 >= #{v}" && next if [ 'set_1_7_min'].include?(k)
      arr << "set_1_7 <= #{v}" && next if [ 'set_1_7_max'].include?(k)

      arr << "set_8_14 >= #{v}" && next if [ 'set_8_14_min'].include?(k)
      arr << "set_8_14 <= #{v}" && next if [ 'set_8_14_max'].include?(k)

      arr << "set_15_21 >= #{v}" && next if [ 'set_15_21_min'].include?(k)
      arr << "set_15_21 <= #{v}" && next if [ 'set_15_21_max'].include?(k)

      arr << "set_22_28 >= #{v}" && next if [ 'set_22_28_min'].include?(k)
      arr << "set_22_28 <= #{v}" && next if [ 'set_22_28_max'].include?(k)

      arr << "set_29_36 >= #{v}" && next if [ 'set_29_36_min'].include?(k)
      arr << "set_29_36 <= #{v}" && next if [ 'set_29_36_max'].include?(k)

      arr << "set_37_42 >= #{v}" && next if [ 'set_37_42_min'].include?(k)
      arr << "set_37_42 <= #{v}" && next if [ 'set_37_42_max'].include?(k)

      arr << "set_1_9 >= #{v}" && next if [ 'set_1_9_min'].include?(k)
      arr << "set_1_9 <= #{v}" && next if [ 'set_1_9_max'].include?(k)

      arr << "set_10_19 >= #{v}" && next if [ 'set_10_19_min'].include?(k)
      arr << "set_10_19 <= #{v}" && next if [ 'set_10_19_max'].include?(k)

      arr << "set_20_29 >= #{v}" && next if [ 'set_20_29_min'].include?(k)
      arr << "set_20_29 <= #{v}" && next if [ 'set_20_29_max'].include?(k)

      arr << "set_30_39 >= #{v}" && next if [ 'set_30_39_min'].include?(k)
      arr << "set_30_39 <= #{v}" && next if [ 'set_30_39_max'].include?(k)

      arr << "set_40_42 >= #{v}" && next if [ 'set_40_42_min'].include?(k)
      arr << "set_40_42 <= #{v}" && next if [ 'set_40_42_max'].include?(k)

      arr << "set_s >= #{v}" && next if [ 'set_s_min'].include?(k)
      arr << "set_s <= #{v}" && next if [ 'set_s_max'].include?(k)


      arr << "set_t >= #{v}" && next if [ 'set_t_min'].include?(k)
      arr << "set_t <= #{v}" && next if [ 'set_t_max'].include?(k)

      arr << "set_u >= #{v}" && next if [ 'set_u_min'].include?(k)
      arr << "set_u <= #{v}" && next if [ 'set_u_max'].include?(k)


      arr << "set_w >= #{v}" && next if [ 'set_w_min'].include?(k)
      arr << "set_w <= #{v}" && next if [ 'set_w_max'].include?(k)

      arr << "set_x >= #{v}" && next if [ 'set_x_min'].include?(k)
      arr << "set_x <= #{v}" && next if [ 'set_x_max'].include?(k)

      arr << "set_y >= #{v}" && next if [ 'set_y_min'].include?(k)
      arr << "set_y <= #{v}" && next if [ 'set_y_max'].include?(k)

      arr << "set_z >= #{v}" && next if [ 'set_z_min'].include?(k)
      arr << "set_z <= #{v}" && next if [ 'set_z_max'].include?(k)


      arr << "no_of_odd >= #{v}" && next if [ 'odd_min'].include?(k)
      arr << "no_of_odd <= #{v}" && next if [ 'odd_max'].include?(k)

      arr << "set_left >= #{v}" && next if [ 'set_left_min'].include?(k)
      arr << "set_left <= #{v}" && next if [ 'set_left_max'].include?(k)

      arr << "set_right >= #{v}" && next if [ 'set_right_min'].include?(k)
      arr << "set_right <= #{v}" && next if [ 'set_right_max'].include?(k)

      
      arr << "no_of_even >= #{v}" && next if [ 'even_min'].include?(k)
      arr << "no_of_even <= #{v}" && next if [ 'even_max'].include?(k)



      arr << "#{k} = #{v}" && next if ['set_up','set_down'].include?(k)
      arr << "#{k} <= #{v}" && next if ['d2','d3','d4','d5','d6','d7','d8','d9',
        'no_end_0', 'no_end_1', 'no_end_2',	'no_end_3',	'no_end_4',	'no_end_5',	'no_end_6',	'no_end_7',	'no_end_8',	'no_end_9',
        
        # 'set_1_7','set_8_14', 'set_15_21','set_22_28','set_29_36','set_37_42',
        # 'set_1_9','set_10_19','set_20_29','set_30_39','set_40_42',
        #'set_left', 'set_right'
        
      ].include?(k)
      
      #arr << "#{k} >= #{v}" if v != '' && (k == 'no' || k == 'set_1_21' || k == 'set_22_42')
    end
    arr.delete_if {|e| e.match('no >')}
    conditions2 = arr.join(' AND ')

    conditions2 += ' AND NOT (
      (n1 = (n2-1) AND n2 = (n3-1)) OR
      (n2 = (n3-1) AND n3 = (n4-1)) OR
      (n3 = (n4-1) AND n4 = (n5-1)) OR
      (n1 = (n2-1) AND n4 = (n5-1)) OR
      (n2 = (n3-1) AND n4 = (n5-1)) OR
      (n1 = (n2-1) AND n3 = (n4-1))
    )'
    conditions = conditions2 + " AND no >= #{params[:no]}"
    conditions2 += has_set(most_break(params[:no_of_most_break_1].to_i, draw_no)) if params[:no_of_most_break_1]
    conditions2 += has_pair(most_break(params[:no_of_most_break_2].to_i, draw_no)) if params[:no_of_most_break_2]
    conditions2 += has_triple(most_break(params[:no_of_most_break_3].to_i, draw_no)) if params[:no_of_most_break_3]
    conditions2 += has_four(most_break(params[:no_of_most_break_4].to_i, draw_no)) if params[:no_of_most_break_4]
    
    conditions2 += no_pairs(most_break(params[:no_of_most_break_no_2].to_i, draw_no)) if params[:no_of_most_break_no_2]
    conditions2 += no_triple(most_break(params[:no_of_most_break_no_3].to_i, draw_no)) if params[:no_of_most_break_no_3]
    conditions2 += no_fours(most_break(params[:no_of_most_break_no_4].to_i, draw_no)) if params[:no_of_most_break_no_4]
    conditions2 += no_fives(most_break(params[:no_of_most_break_no_5].to_i, draw_no)) if params[:no_of_most_break_no_5]


    lr = Result.find_by_no(draw_no)
    lra = no_pairs([lr.n1, lr.n2, lr.n3, lr.n4, lr.n5])
    #lra = no_triple([lr.n1, lr.n2, lr.n3, lr.n4, lr.n5])
    conditions2 += lra
    conditions2 += has_set(lr.numbers_in_last(params[:no_of_numers_in_last_1].to_i)) if params[:no_of_numers_in_last_1]
    conditions2 += has_pair(lr.numbers_in_last(params[:no_of_numers_in_last_2].to_i)) if params[:no_of_numers_in_last_2]
    conditions2 += has_triple(lr.numbers_in_last(params[:no_of_numers_in_last_3].to_i)) if params[:no_of_numers_in_last_3]
    conditions2 += no_fives(lr.numbers_in_last(params[:no_of_numers_in_last_no_5].to_i)) if params[:no_of_numers_in_last_no_5]
    
    conditions2 += has_set(count_most_often(params[:no_of_most_often_100_1].to_i,draw_no)) if params[:no_of_most_often_100_1]
    conditions2 += has_pair(count_most_often(params[:no_of_most_often_100_2].to_i,draw_no)) if params[:no_of_most_often_100_2]
    conditions2 += has_triple(count_most_often(params[:no_of_most_often_100_3].to_i,draw_no)) if params[:no_of_most_often_100_3]
    conditions2 += has_four(count_most_often(params[:no_of_most_often_100_4].to_i,draw_no)) if params[:no_of_most_often_100_4]
    
    conditions2 += no_pairs(count_most_often(params[:no_of_most_often_100_no_2].to_i,draw_no)) if params[:no_of_most_often_100_no_2]
    conditions2 += no_triple(count_most_often(params[:no_of_most_often_100_no_3].to_i,draw_no))if params[:no_of_most_often_100_no_3]
    conditions2 += no_fours(count_most_often(params[:no_of_most_often_100_no_4].to_i,draw_no)) if params[:no_of_most_often_100_no_4]
    conditions2 += no_fives(count_most_often(params[:no_of_most_often_100_no_5].to_i,draw_no)) if params[:no_of_most_often_100_no_5]

    conditions2 += has_set(count_occurance(params[:no_of_most_rare_1].to_i,draw_no)) if params[:no_of_most_rare_1]
    conditions2 += has_pair(count_occurance(params[:no_of_most_rare_2].to_i,draw_no)) if params[:no_of_most_rare_2]
    conditions2 += has_triple(count_occurance(params[:no_of_most_rare_3].to_i,draw_no)) if params[:no_of_most_rare_3]
    
    conditions2 += has_four(count_occurance(params[:no_of_most_rare_4].to_i,draw_no)) if params[:no_of_most_rare_4]
    conditions2 += no_pairs(count_occurance(params[:no_of_most_rare_no_2].to_i,draw_no)) if params[:no_of_most_rare_no_2]
    conditions2 += no_triple(count_occurance(params[:no_of_most_rare_no_3].to_i,draw_no))if params[:no_of_most_rare_no_3]
    conditions2 += no_fours(count_occurance(params[:no_of_most_rare_no_4].to_i,draw_no)) if params[:no_of_most_rare_no_4]
    conditions2 += no_fives(count_occurance(params[:no_of_most_rare_no_5].to_i,draw_no)) if params[:no_of_most_rare_no_5]



    all_count = Result.count( :conditions => ['set_up = ? AND no > ?', params[:set_up], params[:no]])


    #conditions2 += ' AND n1=2 AND n2=7 AND n3=18 AND n4 = 40 AND n5 = 42 '
    #conditions2 += ' AND n1 = 6 and n2 = 25 and n3 = 30 and n4 = 36 and n5 = 42 '

 

    #conditions += ' AND n1 < 22 AND n2 < 34 AND n5 > 24'  #18
    #conditions2 += ' AND n1 < 22 AND n2 < 34 AND n5 > 24'
		conditions += " AND most_breaks.m#{params[:no_of_most_break_1]} >= 1 " if params[:no_of_most_break_1]
    conditions += " AND most_breaks.m#{params[:no_of_most_break_2]} >= 2 " if params[:no_of_most_break_2]
    conditions += " AND most_breaks.m#{params[:no_of_most_break_3]} >= 3 " if params[:no_of_most_break_3]
    conditions += " AND most_breaks.m#{params[:no_of_most_break_4]} >= 4 " if params[:no_of_most_break_4]

    conditions += " AND most_breaks.m#{params[:no_of_most_break_no_2]} <= 2 " if params[:no_of_most_break_2]
    conditions += " AND most_breaks.m#{params[:no_of_most_break_no_3]} <= 3 " if params[:no_of_most_break_3]
    conditions += " AND most_breaks.m#{params[:no_of_most_break_no_4]} <= 4 " if params[:no_of_most_break_4]
    conditions += " AND most_breaks.m#{params[:no_of_most_break_no_5]} <= 5 " if params[:no_of_most_break_5]

    conditions += " AND most_oftens.m#{params[:no_of_most_often_100_1]} >= 1 " if params[:no_of_most_often_100_1]
    conditions += " AND most_oftens.m#{params[:no_of_most_often_100_2]} >= 2 " if params[:no_of_most_often_100_2]
    conditions += " AND most_oftens.m#{params[:no_of_most_often_100_3]} >= 3 " if params[:no_of_most_often_100_3]
    conditions += " AND most_oftens.m#{params[:no_of_most_often_100_4]} >= 4 " if params[:no_of_most_often_100_4]

    conditions += " AND most_oftens.m#{params[:no_of_most_often_100_no_2]} <= 2 " if params[:no_of_most_often_100_no_2]
    conditions += " AND most_oftens.m#{params[:no_of_most_often_100_no_3]} <= 3 " if params[:no_of_most_often_100_no_3]
    conditions += " AND most_oftens.m#{params[:no_of_most_often_100_no_4]} <= 4 " if params[:no_of_most_often_100_no_4]
    conditions += " AND most_oftens.m#{params[:no_of_most_often_100_no_5]} <= 5 " if params[:no_of_most_often_100_no_5]

    r = Result.count(:joins => [:most_break, :most_often], :conditions => conditions)
    
    #the lowest occurance in last 100 draws

    #old_results = Result.all(:select => 'n1, n2, n3, n4, n5', :conditions => 'no <10000').each do |r|
    #	conditions2 += no_fives([r.n1, r.n2, r.n3, r.n4, r.n5])
    #end
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
    
    #7 plus
    a = lr.numbers_in_last_and_add(20,7)
    conditions2 += has_set(a)
    a = lr.numbers_in_last_and_add(2,7)
    conditions2 += no_fives(a)
    a = lr.numbers_in_last_and_add(1,7)
    conditions2 += no_fours(a)
    
    
    #8 plus
    a = lr.numbers_in_last_and_add(15,8)
    conditions2 += has_set(a)
    a = lr.numbers_in_last_and_add(4,8)
    conditions2 += no_fives(a)
    a = lr.numbers_in_last_and_add(2,8)
    conditions2 += no_fours(a)
    
    
    #9 plus
    a = lr.numbers_in_last_and_add(18,9)
    conditions2 += has_set(a)
    a = lr.numbers_in_last_and_add(3,9)
    conditions2 += no_fives(a)
    a = lr.numbers_in_last_and_add(1,9)
    conditions2 += no_fours(a)



    conditions2 += " AND id NOT BETWEEN #{lr.combination_id}-10000 AND #{lr.combination_id}+10000 "
    
    rc = 3
    rs = []
    rn =[]

#    c_count = Combination.count(:conditions => conditions2, :order => :id)
#    c_all = Combination.all(:conditions => conditions2, :order => :id)
#    for_next_rand = ''
#    1.upto(rc) do |i|
#      ri = rand(c_count)
#      for_next_rand += "Nr wylosowanej: #{ri}"
#      rn.push(c_all[ri].n1, c_all[ri].n2, c_all[ri].n3, c_all[ri].n4, c_all[ri].n5)
#      rs << c_all[ri] #if !rn.include?()
#    end
    #############
    c_count = Combination.count(:conditions => conditions2, :order => :id)
    #c_all = Combination.all(:conditions => conditions2, :order => :id)
    #ri = rand(c_count)
    #cc = c_all[ri]

    #c = c.size
#    myfile = File.new('t.txt', "w+")
#    i = 1
#    c_all.each do |v|
#    	myfile.puts("id: #{v.id}: - nr: #{i}: #{v.n1} - #{v.n2} - #{v.n3} - #{v.n4} - #{v.n5} - end\n")
#      puts i
#      i+=1;
#    end
#    myfile.close

    
    #for_next_rand = '' #"RI: #{ri+1} | - #{cc.n1} - #{cc.n2} - #{cc.n3} - #{cc.n4} - #{cc.n5} | - #{cc.set_up} - #{cc.sum} - #{cc.set_a}"

    rs.each do |cc|
      for_next_rand += "# #{cc.n1} - #{cc.n2} - #{cc.n3} - #{cc.n4} - #{cc.n5} | - #{cc.set_up} - #{cc.sum} - #{cc.set_a}"
    end

    render :text => "ALL: #{all_count} - R: #{r} #{} #{}, C: #{c_count}, <br> #{}" #+ for_next_rand
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
	(n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj})) OR
  (n1 IN (#{lrj}) AND n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj}))
)"
  end
  
  def has_four(array)
    lrj = array.join(',')
    return "AND
(
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND (n4 IN (#{lrj}) OR n5 IN (#{lrj}))) OR
	(n1 IN (#{lrj}) AND n2 IN (#{lrj}) AND n4 IN (#{lrj}) AND ( n5 IN (#{lrj}))) OR
	(n2 IN (#{lrj}) AND n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj})) OR
  (n1 IN (#{lrj}) AND n3 IN (#{lrj}) AND n4 IN (#{lrj}) AND n5 IN (#{lrj}))
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
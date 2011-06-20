class AddNewSets < ActiveRecord::Migration
  def self.up
    add_column :results, :set_a, :integer
    add_column :results, :set_b, :integer
    add_column :results, :set_c, :integer
    add_column :results, :set_d, :integer
	
    add_column :results, :set_s, :integer
    add_column :results, :set_t, :integer
    add_column :results, :set_u, :integer
    add_column :results, :set_w, :integer
    add_column :results, :set_x, :integer
    add_column :results, :set_y, :integer
    add_column :results, :set_z, :integer
	
	
    add_column :combinations, :set_a, :integer
    add_column :combinations, :set_b, :integer
    add_column :combinations, :set_c, :integer
    add_column :combinations, :set_d, :integer
	
    add_column :combinations, :set_s, :integer
    add_column :combinations, :set_t, :integer
    add_column :combinations, :set_u, :integer
    add_column :combinations, :set_w, :integer
    add_column :combinations, :set_x, :integer
    add_column :combinations, :set_y, :integer
    add_column :combinations, :set_z, :integer
	
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

    Result.all.each do |r|
      puts r.no
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

  def self.down
  	remove_column :results, :set_a
    remove_column :results, :set_b
    remove_column :results, :set_c
    remove_column :results, :set_d
	
    remove_column :results, :set_s
    remove_column :results, :set_t
    remove_column :results, :set_u
    remove_column :results, :set_w
    remove_column :results, :set_x
    remove_column :results, :set_y
    remove_column :results, :set_z
  
  
    remove_column :combinations, :set_a
    remove_column :combinations, :set_b
    remove_column :combinations, :set_c
    remove_column :combinations, :set_d
	
    remove_column :combinations, :set_s
    remove_column :combinations, :set_t
    remove_column :combinations, :set_u
    remove_column :combinations, :set_w
    remove_column :combinations, :set_x
    remove_column :combinations, :set_y
    remove_column :combinations, :set_z
  end
end

#set_a
#1,2,3,4
#8,9,10,11
#15,16,17,18

#set_c
#5,6,7
#12,13,14
#19,20,21

#set_b
#22,23,24,
#29,30,31,
#36,37,38

#set_d
#25,26,27,28
#32,33,34,35
#39,40,41,32
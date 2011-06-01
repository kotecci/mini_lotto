class AddCombinationId < ActiveRecord::Migration
  def self.up
     add_column :results, :combination_id, :integer
	 #Result.all.each do |r|
	#	r.combination_id = Combination.find_by_n1_and_n2_and_n3_and_n4_and_n5(r.n1, r.n2, r.n3, r.n4, r.n5).id
#		puts r.id if r
	 
	 #end
  end

  def self.down
	remove_column :results, :combination_id
  end
end

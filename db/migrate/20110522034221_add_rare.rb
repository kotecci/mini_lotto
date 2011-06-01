class AddRare < ActiveRecord::Migration
  def self.up
   create_table :rares do |t|
	t.integer :r1
	t.integer :r2
	t.integer :r3
	t.integer :r4
	t.integer :r5
	t.integer :r6
	t.integer :r7
	t.integer :r8
	t.integer :r9
	t.integer :r10
	t.integer :r11
	t.integer :r12
	t.integer :r13
	t.integer :r14
	t.integer :r15
	t.integer :r16
	t.integer :r17
	t.integer :r18
	t.integer :r19
	t.integer :r20
	t.integer :r21
	t.integer :r22
	t.integer :r22
	t.integer :r23
	t.integer :r24
	t.integer :r25
	t.integer :r26
	t.integer :r27
	t.integer :r28
	t.integer :r29
	t.integer :r30
	t.integer :r31
	t.integer :r32
	t.integer :r33
	t.integer :r34
	t.integer :r35
	t.integer :r35
	t.integer :r36
	t.integer :r37
	t.integer :r38
	t.integer :r39
	t.integer :r40
	t.integer :r41
	t.integer :r42
	t.integer :sum_r1
	t.integer :sum_r2
	t.integer :sum_r3
	t.integer :sum_r4
	t.integer :sum_r5
	t.integer :sum_r6
	t.integer :sum_r7
	t.integer :sum_r8
	t.integer :sum_r9
	t.integer :sum_r10
	t.integer :sum_r11
	t.integer :sum_r12
	t.integer :sum_r13
	t.integer :sum_r14
	t.integer :sum_r15
	t.integer :sum_r16
	t.integer :sum_r17
	t.integer :sum_r18
	t.integer :sum_r19
	t.integer :sum_r20
	t.integer :sum_r21
	t.integer :sum_r22
	t.integer :sum_r23
	t.integer :sum_r24
	t.integer :sum_r25
	t.integer :sum_r26
	t.integer :sum_r27
	t.integer :sum_r28
	t.integer :sum_r29
	t.integer :sum_r30
	t.integer :sum_r31
	t.integer :sum_r32
	t.integer :sum_r33
	t.integer :sum_r34
	t.integer :sum_r35
	t.integer :sum_r36
	t.integer :sum_r37
	t.integer :sum_r38
	t.integer :sum_r39
	t.integer :sum_r40
	t.integer :sum_r41
	t.integer :sum_r42
	t.integer :result_id
   end
   
   #add_column :results, :rare_id, :integer
   
  end

  def self.down
	drop_table :rares
	#remove_column :results, :rare_id
  end
end

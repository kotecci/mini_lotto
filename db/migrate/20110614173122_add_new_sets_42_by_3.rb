class AddNewSets42By3 < ActiveRecord::Migration
  def self.up
    add_column :results, :set_1_14, :integer
    add_column :results, :set_15_28, :integer
    add_column :results, :set_29_42, :integer

    add_column :combinations, :set_1_14, :integer
    add_column :combinations, :set_15_28, :integer
    add_column :combinations, :set_29_42, :integer


    set_1_14 = (1..14).to_a
    set_15_28 = (15..28).to_a
    set_29_42 = (29..42).to_a

    Result.all.each do |r|
      puts r.no
      stats = {
        :set_1_14 => 0, :set_15_28 => 0, :set_29_42  => 0
      }

      combination = [r.n1, r.n2, r.n3, r.n4, r.n5]
      combination.each do |n|
        stats[:set_1_14] += 1 if set_1_14.include?(n)
        stats[:set_15_28] += 1 if set_15_28.include?(n)
        stats[:set_29_42] += 1 if set_29_42.include?(n)

      end
      r.set_1_14 = stats[:set_1_14]
      r.set_15_28 = stats[:set_15_28]
      r.set_29_42 = stats[:set_29_42]

      r.save
    end

    

  end

  def self.down
  	remove_column :results, :set_1_14
    remove_column :results, :set_15_28
    remove_column :results, :set_29_42
    remove_column :combinations, :set_1_14
    remove_column :combinations, :set_15_28
    remove_column :combinations, :set_29_42

  end
end
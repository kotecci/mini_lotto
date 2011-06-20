class Result < ActiveRecord::Base

  has_one :rare
  has_one :most_often
  has_one :most_break


  def combbination_id
    Combination.find_by_n1_and_n2_and_n3_and_n4_and_n5(self.n1, self.n2, self.n3, self.n4, self.n5).id
  end

  #ile z najdluzsza przerwa w ostatnich 100 losowaniach powtorzylo sie
  def how_many_most_break(n)
    a = most_breakk(n)
    lrj = a.join(',')
    c = 0
    [self.n1, self.n2, self.n3, self.n4, self.n5].each do |m|
      c += 1 if a.include?(m)
    end
    return [c, a.size]
  end

  def how_many_repeated(n)
    count = 0
    current = [self.n1, self.n2, self.n3, self.n4, self.n5]
    all = []
    (1..n).each do |i|
      previous = Result.find_by_no(self.no-i)
      if previous
        all << [previous.n1, previous.n2, previous.n3, previous.n4, previous.n5]
      end
    end
    all.flatten.uniq.each do |a|
			#[previous.n1, previous.n2, previous.n3, previous.n4, previous.n5].each do |p|
      count += 1 if current.include?(a)
			#end
    end
    count
  end

  def how_many_repeated_add(n, l)
    count = 0
    current = [self.n1, self.n2, self.n3, self.n4, self.n5]
    all = []
    (1..n).each do |i|
      previous = Result.find_by_no(self.no-i)
      if previous
        all << [previous.n1+l, previous.n2+l, previous.n3+l, previous.n4+l, previous.n5+l]
      end
    end
    all.flatten.uniq.each do |a|
			#[previous.n1, previous.n2, previous.n3, previous.n4, previous.n5].each do |p|
      count += 1 if current.include?(a)
			#end
    end
    count
  end


  def numbers_in_last(n)
    all = []
    (1..n).each do |i|
      previous = Result.find_by_no(self.no-i)
      if previous
        all << [previous.n1, previous.n2, previous.n3, previous.n4, previous.n5]
      end
    end
    all.flatten.uniq
  end

  #n - noumber of draws, l - number of numbers
  def numbers_in_last_and_add(n, l)
    all = []
    (1..n).each do |i|
      previous = Result.find_by_no(self.no-i)
      if previous
        all << [previous.n1+l, previous.n2, previous.n3, previous.n4, previous.n5]
      end
    end
    all.flatten.uniq
  end


  def how_many_last_occurance(n)
    a = count_occurance(n)
    lrj = a.join(',')
    c = 0
    [self.n1, self.n2, self.n3, self.n4, self.n5].each do |n|
      c += 1 if a.include?(n)
    end
    return [c, a.size]
  end

  #ile z najczesciej losowanych w ostatnich 100 losowaniach powtorzylo sie
  def how_many_most_often(n)
    a = count_most_often(n)
    lrj = a.join(',')
    c = 0
    [self.n1, self.n2, self.n3, self.n4, self.n5].each do |n|
      c += 1 if a.include?(n)
    end
    return [c, a.size]
  end


  def most_breakk(c)
    numbers = {}
    sorted =[]
    (1..42).to_a.each do |e|
      conditions = "(n1 = #{e} OR n2 = #{e} OR n3 = #{e} OR n4 = #{e} OR n5 = #{e})"
      conditions += " AND (no < #{self.no})" #if !to.nil?
      r = Result.all(:conditions => conditions,
        :order =>'no DESC')
      date = r.first.date #if !r.empty?
      numbers[e] = date
    end
    numbers.sort_by{|k,v| v}.each{|e| sorted << e[0]}
    while numbers[c] == numbers[c+1]
      c += 1
    end
    #p sorted
    return sorted[0..c-1]
  end
  
  def count_occurance(c)
    numbers = {}
    sorted = []
    (1..42).to_a.each do |e|
      conditions = "(n1 = #{e} OR n2 = #{e} OR n3 = #{e} OR n4 = #{e} OR n5 = #{e})"
      conditions += " AND (no >= #{no-100})" #if !n.nil?
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
  
  #ile najczesciej losowanych powtorzylo sie 100 losowan wstecz
  def count_most_often(c)
    numbers = {}
    sorted = []
    (1..42).to_a.each do |e|
      conditions = "(n1 = #{e} OR n2 = #{e} OR n3 = #{e} OR n4 = #{e} OR n5 = #{e})"
      conditions += " AND (no >= #{no-100})" #if !n.nil?
      r = Result.count(:conditions => conditions,
        :order =>'no DESC')
      numbers[e] = r
    end
    numbers.sort_by{|k,v| v}.reverse.each{|e| sorted << e[0]}
    while numbers[c] == numbers[c+1]
      c += 1
    end
    #p sorted
    return sorted[0..c-1]
  end

end

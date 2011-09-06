class Greed
  def initialize
    @counts = [0,0,0,0,0,0]
  end

  def score_of(*dice)
    score = 0
    dice.each do |die_value|
      score += score_of_one(die_value)
    end
    score
  end

  def score_of_one(die_value)
    die = DieFactory.create_die(die_value)

    score = die.individual_value

    if third_of(die_value)
      score += die.triplett_bonus
    end

    score
  end

  def third_of(die_value)
    @counts[die_value-1] += 1
    @counts[die_value-1] == 3
  end
end

class DieFactory
  def self.create_die(die_value)
    if die_value == 1
      DieOfOne.new
    elsif die_value == 5
      DieOfFive.new
    else
      DieOfNonOneOrFive.new(die_value)
    end
  end
end

class DieOfOne
  def individual_value
    100
  end

  def triplett_bonus
    700
  end
end

class DieOfFive
  def individual_value
    50
  end

  def triplett_bonus
    350
  end
end 

class DieOfNonOneOrFive
  def initialize(die_value)
    @die_value = die_value
  end

  def individual_value
    0
  end

  def triplett_bonus
    @die_value * 100
  end
end

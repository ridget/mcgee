module DiceRollModifier
  BONUS_TABLE = {
    1 => -5,
    2..3 => -4,
    4..5 => -3,
    6..7 => -2,
    8..9 => -1,
    10..11 => 0,
    12..13 => 1,
    14..15 => 2,
    16..17 => 3,
    18..19 => 4,
    20..21 => 5,
    22..23 => 6,
    24..25 => 7,
    26..27 => 8,
    28..29 => 9,
    30 => 10
  }

  class RangedHash
    def initialize(hash)
      @ranges = hash
    end

    def [](lookup_key)
      @ranges.each do |key, value|
        return value if key === lookup_key
      end
      nil
    end
  end

  def calculate(ability_score)
    RangedHash.new(BONUS_TABLE)[ability_score]
  end

  module_function :calculate
end

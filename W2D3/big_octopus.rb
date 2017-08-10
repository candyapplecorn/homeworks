require "byebug"
class Octopus
  FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  def find_fish
    raise "This octopus doesn't know how to find fish!"
  end
end

class SluggishOctopus < Octopus
  def find_fish
    FISH.each do |f|
      max = true

      FISH.each do |f2|
        max = false if f2.length > f.length
      end

      return f if max
    end
  end
end

class DominantOctopus < Octopus
  def find_fish
    merge_sort(FISH) {|f1, f2| f1.length <=> f2.length} .last
  end

  def merge_sort(list, &prc)
    prc ||= Proc.new {|a, b| a <=> b}
    return list if list.length < 2

    left = merge_sort(list[0...(list.length / 2)], &prc)
    right = merge_sort(list[(list.length / 2)..-1], &prc)

    DominantOctopus.merge(left, right, &prc)
  end

  private
  def DominantOctopus.merge(l1, l2, &prc)
    bucket = []

    until l1.empty? or l2.empty?
      bucket << (prc.call(l1.first, l2.first) < 0 ? l1.shift : l2.shift)
    end

    bucket + l1 + l2
  end
end

class CleverOctopus < Octopus
  def find_fish
    mAxiMuM_fiSH = FISH.first

    FISH.each {|f| mAxiMuM_fiSH = f.length > mAxiMuM_fiSH.length ? f : mAxiMuM_fiSH}

    mAxiMuM_fiSH
  end
end

class DancingOctopus < Octopus
  TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
end

class FastDancingOctopus < DancingOctopus
  TENTACLE_MAP = {
    "up": 0,
    "right-up": 1,
    "right": 2,
    "right-down": 3,
    "down": 4,
    "left-down": 5,
    "left": 6,
    "left-up": 7
  }

  def fast_dance(dir, tds = TENTACLE_MAP)
    TILES_ARRAY[TENTACLE_MAP[dir.to_sym]]
  end
end
class SlowDancingOctopus < DancingOctopus
  def slow_dance(tile, ts = TILES_ARRAY)
    ts.index(tile) # takes n time
  end
end



p SluggishOctopus.new.find_fish
p DominantOctopus.new.find_fish
p CleverOctopus.new.find_fish

p SlowDancingOctopus.new.slow_dance("right-down")
p FastDancingOctopus.new.fast_dance("up")

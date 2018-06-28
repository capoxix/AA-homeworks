#Guess

def sluggish_octopus(octopus)
  longest_octopus = nil
  i = 0
  while i < octopus.length
    j = i + 1
    while j < octopus.length
      if octopus[i] > octopus[j]
        longest_octopus = octopus[i]
      else
        longest_octopus = octopus[j]
      end
    end
  end

  longest_octopus
end

def dominant_octopus(octopus)
  sorted = quick_sort(octopus)
  sorted.last
end

def quick_sort(array)
  return array if array.length <= 1
  pivot = array.first

  left = array[1..-1].select{|ele| ele if ele.length < pivot.length}
  right = array[1..-1].select{|ele| ele if ele.length >= pivot.length}

  quick_sort(left) + [pivot] + quick_sort(right)
end

def clever_octopus(octopus)
  longest_octopus = octopus.first

  octopus[1..-1].each do |octo|
    longest_octopus = octo if octo.length > longest_octopus.length
  end

  longest_octopus
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index {|move, idx| return idx if move == direction}
end

tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2,
              "right-down" => 3, "down" => 4, "left-down" => 5,
              "left" =>6,  "left-up" => 7
            }

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end

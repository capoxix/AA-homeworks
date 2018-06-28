
=begin
# My Guess:
Run time in my computer
500 elements
                user     system      total        real
Tot. Merge:    0.007267   0.000241   0.007508 (  0.007506)
Tot. Bubble:   0.065744   0.000104   0.065848 (  0.065920)
Avg. Merge:    0.002422   0.000080   0.002503 (  0.002502)
Avg. Bubble:   0.021915   0.000035   0.021949 (  0.021973)

1000 elements
                user     system      total        real
Tot. Merge:    0.013773   0.000205   0.013978 (  0.013976)
Tot. Bubble:   0.230931   0.000229   0.231160 (  0.231222)
Avg. Merge:    0.004591   0.000068   0.004659 (  0.004659)
Avg. Bubble:   0.076977   0.000076   0.077053 (  0.077074)

5000 elements
                user     system      total        real
Tot. Merge:    0.057134   0.000437   0.057571 (  0.057616)
Tot. Bubble:   6.103461   0.015672   6.119133 (  6.131186)
Avg. Merge:    0.019045   0.000146   0.019190 (  0.019205)
Avg. Bubble:   2.034487   0.005224   2.039711 (  2.043729)

10000 elements
                user     system      total        real
Tot. Merge:    0.112824   0.000827   0.113651 (  0.113680)
Tot. Bubble:  24.990801   0.085360  25.076161 ( 25.143052)
Avg. Merge:    0.037608   0.000276   0.037884 (  0.037893)
Avg. Bubble:   8.330267   0.028453   8.358720 (  8.381017)

I have tested out a few different input amount to compare time. I did
500, 1000, 5000 and 10,000. I noticed that the differences showed a pattern
of following a run time of n^2. 1000 which was 2 times bigger than 500
took .23, whcih was 4 about times much longer than .065. This was the same
for 5,000 and 10,000 which was 6.12 versus 25.08.

Also, bubble sort's time took 100 times longer when we increased the input by 10 times
 of it's original input. Thus, showing the n^2 run time pattern that we were expecting.
My guess is that for 100,000 elements which is twice as much as 50,000, it would
take about 4x that of 50,000 which is approximately about 4000 seconds.

=end
#!/usr/bin/env ruby
require 'io/console'
require 'benchmark'

class SortingDemo
  # Bubble Sort: O(n^2)
  def self.bubble_sort!(array)
    len = array.length - 1
    sorted = false

    until sorted
      sorted = true
      (0...len).each do |idx|
        if array[idx] > array[idx + 1]
          array[idx], array[idx + 1] = array[idx + 1], array[idx]
          sorted = false
        end
      end
    end

    array
  end

  def self.bubble_sort(array)
    bubble_sort!(array.dup)
  end

  # Merge Sort: O(n*lg(n))
  def self.merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def self.merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  def self.performance_test(size, count)
    arrays_to_test = Array.new(count) { random_arr(size) }

    Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
                        "Avg. Merge:  ", "Avg. Bubble: ") do |b|
      merge = b.report("Tot. Merge:  ") { run_merge_sort(arrays_to_test) }
      bubble = b.report("Tot. Bubble: ") { run_bubble_sort(arrays_to_test) }
      [merge/count, bubble/count]
    end
  end

  def self.random_arr(n)
    Array.new(n) { rand(n) }
  end

  def self.run_bubble_sort(arrays)
    arrays.each do |array|
      array_to_test = array.dup
      bubble_sort(array_to_test)
    end
  end

  def self.run_merge_sort(arrays)
    arrays.each do |array|
      array_to_test = array.dup
      merge_sort(array_to_test)
    end
  end

  def self.run_performance_tests(multiplier = 5, rounds = 3)
    [1, 10, 100, 1000, 10000].each do |size|
      size *= multiplier
      wait_for_keypress(
        "Press any key to benchmark sorts for #{size} elements"
      )
      performance_test(size, rounds)
    end
  end

  def self.wait_for_keypress(prompt)
    puts prompt
    STDIN.getch
  end
end

SortingDemo.run_performance_tests()

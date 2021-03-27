def merge_sort(arr)
  return arr if arr.length == 1

  halves = arr.each_slice((arr.length / 2.0).round).to_a
  left = merge_sort(halves[0])
  right = merge_sort(halves[1])

  (0..(arr.length - 1)).each do |i|
    if left.empty? || right.empty?
      last = left.empty? ? right : left
      arr[i..-1] = last
      break
    end
    arr[i] = left[0] < right[0] ? left.slice!(0) : right.slice!(0)
  end
  arr
end

arr = Array.new(rand(6..15)) { rand(1...100) }
puts "Unsorted array: #{arr}"
puts "Sorted array: #{merge_sort(arr)}"

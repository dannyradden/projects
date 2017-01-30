class BubbleSort
  def sort(collection)
    stage = collection.length
    until stage == 1
      i = 0
      until i == (stage - 1)
        previous = collection[i]
        current = collection[i + 1]
        if current < previous
          collection[i, 2] = collection[i, 2].reverse
        end
        i += 1
      end
      stage -= 1
    end
    collection
  end
end

sorter = BubbleSort.new

puts sorter.sort(["d", "b", "a", "c", "f", "e"])

# Alternate Method
#
# class BubbleSort
#   def sort(collection)
#     stage = collection.length
#     until stage == 1
#       collection.each_with_index.each do |x, id|
#         if id < stage - 1
#           if x > collection[id + 1]
#             collection[id, 2] = collection[id, 2].reverse
#           end
#         end
#       end
#       stage -= 1
#     end
#     collection
#   end
# end
#
# sorter = BubbleSort.new
#
# puts sorter.sort(["d", "b", "g", "c", "f", "e", "a"])

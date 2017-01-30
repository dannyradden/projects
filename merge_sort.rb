# It's not pretty but it works
# I used a bottom-up approach.
class MergeSort
  def sort(collection)
    i = 1
    x = []
    length = collection.length.to_f
    marker = 0
    a = collection.shift(i)
    b = collection.shift(i)
    while i <= (length / 2).ceil
      if a.length.zero? && b.length.zero?
        a = []
        b = []
        a = collection.shift(i)
        b = collection.shift(i)
        if marker == 1
          marker = 0
        else
          i *= 2
          marker = 1
          collection = x
          final = x[0..collection.length]
          x = []
        end
      elsif a.length.zero?
        x << b.shift
        marker = 1
      elsif b.length.zero?
        x << a.shift
        marker = 1
      elsif a[0] < b[0]
        x << a.shift
        marker = 1
      else
        x << b.shift
        marker = 1
      end
    end
    final
  end
end

sorter = MergeSort.new

puts sorter.sort(["g", "e", "c", "a", "h", "f", "d", "b"])

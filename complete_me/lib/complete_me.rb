require 'pry'

class CompleteMe

  attr_accessor :root_node, :counter

  def initialize
    @root_node = Node.new('')
    $counter = counter = 0
    $suggestions = suggestions = ""
    $word_temp = ""
  end

  def insert word
    #binding.pry
    $word_temp = ""
    first_letter = word[0]
    remainder = word[1..-1]

    if root_node.children[first_letter] == nil
      root_node.children[first_letter] = Node.new(first_letter)
      root_node.children[first_letter].insert_node(remainder)
    else
      root_node.children[first_letter].insert_node(remainder)
    end
  end

  def count
    root_node.children.each do |key, value|
      $counter +=1 if value.terminate == true && value != nil
      value.count_node
    end
    $counter
  end

  def insert_words words
      words.each do |word|
        insert word
      end
  end

  def populate(file_contents)
    insert_words(file_contents.split("\n"))
  end

  def suggest subscript
    #binding.pry
    first_letter = subscript[0]
    remainder = subscript[1..-1]

    if root_node.children[first_letter] == nil
      puts "No word in this dictionary starts with the given subscript."
    else
      root_node.children[first_letter].suggest_node(remainder)
    end
    print "------\nPossible Words:\n#{$suggestions} \n------"
  end
end


class Node

  attr_accessor :word, :children, :terminate, :node_word, :letter

  def initialize(letter) #h
    @terminate = false
    @children = {}
    @letter = letter
    @node_word = node_word = ""
  end

  def insert_node word  # ey
    @node_word = $word_temp + letter
    $word_temp = @node_word
    if word.length != 0
      first_letter = word[0]  #y
      remainder = word[1..-1] #""
      if children[first_letter] == nil
        children[first_letter] = Node.new(first_letter)
        children[first_letter].insert_node(remainder)
      else
        children[first_letter].insert_node(remainder)
      end
    else
      @terminate = true
    end
  end

  def suggest_node(word)
    if word.length != 0
      first_letter = word[0]  #t
      remainder = word[1..-1] #""
      if children[first_letter] == nil
        puts "No word in this dictionary starts with the given subscript."
      else
        children[first_letter].suggest_node(remainder)
      end
    else
      add_words
    end
  end

  def  add_words
    #binding.pry
    children.each do |key, value|
      if value.terminate == true && value != nil
        $suggestions += value.node_word + " "
      end
      value.add_words
    end
  end

  def count_node
    children.each do |key, value|
      $counter += 1 if value.terminate == true && value != nil
      value.count_node
    end
  end

end



cm = CompleteMe.new
#binding.pry
#cm.insert_words(['hey', 'apple', 'help'])
#cm.insert_words ['a', 'banana', 'hey', 'hello']
#cm.populate(File.read("./lib/medium.txt"))
cm.populate(File.read("/usr/share/dict/words"))
#binding.pry
cm.suggest gets.chomp
puts "\n"
puts "Words in dictionary:#{cm.count}"
#binding.pry
puts ""

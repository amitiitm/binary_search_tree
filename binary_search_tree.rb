class Node
	attr_reader :key, :left, :right

	def initialize( key )
		@key = key
		@left = nil
		@right = nil
	end

	def insert( new_key )
		if new_key <= @key
			@left.nil? ? @left = Node.new( new_key ) : @left.insert( new_key )
		elsif new_key > @key
			@right.nil? ? @right = Node.new( new_key ) : @right.insert( new_key )
		end
	end
end

class BinarySearchTree

	def initialize
		@root = nil
	end

	def insert( key )
		if @root.nil?
			@root = Node.new( key )
		else
			@root.insert( key )
		end
	end

	def search( key, node=@root, node_arr = [] )
		if node.nil?
			node_arr << 'Not Found'
			return join_arr(node_arr)
		end
		if key < node.key
			node_arr << node.key
			search( key, node.left, node_arr )
		elsif key > node.key
			node_arr << node.key
			search( key, node.right, node_arr )
		else
			node_arr << key
			return join_arr(node_arr)
		end
	end

	def join_arr(node_arr)
		node_arr.join('-')
	end

end

tree = BinarySearchTree.new
tree.insert(50)
tree.insert(25)
tree.insert(75)
tree.insert(12)
tree.insert(37)
tree.insert(87)
tree.insert(63)
puts tree.inspect

puts "--------------Searching Tree---------"
puts tree.search(75).inspect
puts tree.search(76).inspect
puts tree.search(77).inspect

puts tree.search(12).inspect

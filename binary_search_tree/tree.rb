require_relative 'node.rb'

class Tree
    attr_accessor :root
    
    def initialize(array)
        @array = array.sort.uniq
        @root = build_tree(@array)
    end
    
    def build_tree(array)
        return if array.empty?
        middle = array.length / 2
        node = Node.new(array[middle])
        node.left = build_tree(array[0...middle])
        node.right = build_tree(array[middle+1..-1])
        node
    end

    def insert(data, node=root)
        return "Error: Duplicate values not allowed." if data == node.data
        if data < node.data
            node.left ? insert(data, node.left) : node.left = Node.new(data)
        else 
            node.right ? insert(data, node.right) : node.right = Node.new(data)
        end
    end

    def find(data, root = @root)
        return nil if root.nil?
        if data == root.data
            return root
        elsif data > root.data
            find(data, root.right)
        else data < root.data
            find(data, root.left)
        end
    end
    # Here starts the process of deletion for cases of node with zero, one, and two children.
    def delete(data)
        node = find(data)
        if !node.nil?
            remove(node)
        end
    end

    def remove(node)
        if node.left.nil? && node.right.nil?
            node = nil
        elsif node.left.nil? && !node.right.nil?
            node = node.right
        elsif node.right.nil? && !node.left.nil?
            node = node.left
        else delete_node_w_babies(node)
        end
    end

    def delete_node_w_babies(node)
        min_node = find_min(node.right)
        replace_node(min_node, node)
        remove_min(min_node)
    end

    def find_min(node)
        if node.left.nil?
            min_node = node
            return min_node
        else 
            find_min(node.left)
        end
    end

    def replace_node(min_node, node)
        node.data = min_node.data
    end

    def remove_min(min_node)
        min_node = nil
    end

    def level_order
        queue = [@root]
        output = []
        until queue.empty?
            node = queue.shift
            block_given? ? yield(node) : output << node.data
            queue << node.left unless node.left.nil?
            queue << node.right unless node.right.nil?
        end
        output unless block_given?
    end

    def level_order_rec(queue = [@root], output = [], &block)
        return if queue.empty?
        (queue.length).times do
            queue << queue[0].left if queue[0].left
            queue << queue[0].right if queue[0].right
            block_given? ? yield(queue.shift) : output << queue.shift.data
        end
        level_order_rec(queue, output, &block)
        output unless block_given?
    end

    def preorder(node = @root, output = [])
        return if node.nil?
        block_given? ? yield(node) : output << node.data
        preorder(node.left, output)
        preorder(node.right, output)
        output
    end

    def inorder(node = @root, output = [])
        return if node.nil?
        yield(node) if block_given?
        inorder(node.left, output)
        output << node.data
        inorder(node.right, output)
        output
    end

    def postorder(node = @root, output = [])
        return if node.nil?
        yield(node) if block_given?
        postorder(node.left, output)
        postorder(node.right, output)
        output << node.data
        output
    end

    # converts argument to node by using #find function and then finds depth by calling #find_depth
    def depth(value)
        node = find(value)
        find_depth(node)
    end

    def find_depth(node = @root)
        return -1 if node.nil?
        left_depth = find_depth(node.left)
        right_depth = find_depth(node.right)
        left_depth > right_depth ? left_depth + 1 : right_depth + 1
    end

    def balanced?
        (find_depth(@root.left) - find_depth(@root.right)).abs <= 1
    end

    def rebalance!
        return "Tree is already balanced!" if balanced?
        @root = build_tree(level_order.sort.uniq)
    end
end

#tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
class DoubleListNode
  attr_accessor :val, :prev, :next
  def initialize(val, prev=nil, _next=nil)
    @val = val
    @prev = prev
    @next = _next
  end
end

class DoublyLinkedList
  attr_reader :head, :tail, :size
  def initialize
    @size = 0
  end

  def values
    return if @head.nil?
    values = []

    node = @head
    while node
      values << node.val
      node = node.next
    end
    values
  end

  def reverse_values
    return if @size.zero?
    values = []

    node = @tail
    while node
      values << node.val
      node = node.prev
    end
    values
  end

  def insert(*vals)
    vals.each {|v| insert_single(v)}
  end

  def insert_single(val)
    if (node = @head)
      while node.next!=nil
        node = node.next
      end

      @tail = DoubleListNode.new(val, node)
      node.next = @tail
      @size += 1
      return
    end

    @head = DoubleListNode.new(val)
    @size = 1
    return
  end

  def get_at(i)
    if i.zero?
      return @head
    end

    count = 0

    node = @head
    while count < i
      if node.nil?
        raise IndexError
      else
        node = node.next
        count+=1
      end
    end
    return node
  end

  def add_at_head(val)
    new_node = DoubleListNode.new(val)
    new_node.next = @head
    @head.prev = new_node
    @head = new_node
    @size += 1
  end

  alias add_at_tail insert

  def add_at_index(i, val)
    if @head.nil?
      insert(val)
      return
    end

    if i.zero?
      add_at_head(val)
      return
    end

    node = @head
    count = 0

    while count < i - 1
      if node.nil?
        raise IndexError
      else
        node = node.next
        count += 1
      end
    end

    temp = node.next
    new_node = DoubleListNode.new(val)
    new_node.next = node.next
    new_node.prev = node.next
    if node.next.nil?
      @tail = new_node
    end
    node.next = new_node
    @size += 1
  end

  def delete_at_index(i)
    if @head.nil?
      raise IndexError
      return
    end

    if i.zero?
      @head = @head.next
      @size -= 1
      return
    end

    node = @head
    count = 0
    while count < i - 1
      if node.nil?
        raise IndexError
      else
        node = node.next
        count += 1
      end
    end
    # node is (i-1)th node
    if i == @size - 1
      @tail = node
    end
    node.next = node.next.next
    @size -= 1
  end
end

# getAt
# addAtHead
# addAtTail
# addAtIndex
# deleteAtIndex

# require "rspec"
RSpec.describe DoublyLinkedList do
  let(:list) { DoublyLinkedList.new }

  describe "#insert/#add_at_tail" do
    %i[insert add_at_tail].each do |m|
      it "#{m} 1 correctly" do
        list.public_send(m, 1)
        expect(list.head.val).to eq(1)
        expect(list.size).to eq(1)
      end

      it "#{m} 1, 2 correctly" do
        list.public_send(m, 1)
        list.public_send(m, 2)
        expect(list.head.val).to eq(1)
        expect(list.head.next.val).to eq(2)
        expect(list.head.next.prev.val).to eq(1)
        expect(list.size).to eq(2)
      end

      it "#{m} [1, 2] correctly" do
        list.public_send(m, 1, 2)
        expect(list.head.val).to eq(1)
        expect(list.head.next.val).to eq(2)
        expect(list.head.next.prev.val).to eq(1)
        expect(list.size).to eq(2)
      end
    end
  end

  describe "#get_at" do
    it "returns correct result" do
      list.insert(1, 2, 3)
      expect(list.get_at(0).val).to eq(1)
      expect(list.get_at(1).val).to eq(2)
      expect(list.get_at(2).val).to eq(3)
    end
  end

  describe "#add_at_head" do
    it "returns correct result" do
      list.insert(1, 2, 3)
      old_head = list.head
      list.add_at_head(4)
      expect(list.head.val).to eq(old_head.prev.val)
      expect(list.head.next.val).to eq(1)
      expect(list.size).to eq(4)
    end
  end

  describe "#add_at_index" do
    it "adds at 0th correctly" do
      list.insert(1, 2, 3)
      list.add_at_index(0, 9)
      expect(list.head.val).to eq(9)
      expect(list.tail.val).to eq(3)
      expect(list.size).to eq(4)
    end

    it "adds at 2th correctly" do
      list.insert(1, 2, 3, 4)
      list.add_at_index(2, 9)
      expect(list.head.next.next.val).to eq(9)
      expect(list.tail.val).to eq(4)
      expect(list.size).to eq(5)
    end

    it "adds at end correctly" do
      list.insert(1, 2, 3, 4)
      list.add_at_index(4, 9)
      expect(list.head.next.next.next.next.val).to eq(9)
      expect(list.tail.val).to eq(9)
      expect(list.size).to eq(5)
    end

    it "throws index error when out of bound" do
      list.insert(1, 2, 3, 4)
      expect { list.add_at_index(6, 9) }.to raise_error(IndexError)
    end
  end

  describe "#delete_at_index" do
    it "deletes correctly at 0th" do
      list.insert(1,2,3,4)
      list.delete_at_index(0)
      expect(list.head.val).to eq(2)
      expect(list.tail.val).to eq(4)
      expect(list.size).to eq(3)
    end

    it "deletes correctly at 2th" do
      list.insert(1,2,3,4)
      list.delete_at_index(2)
      expect(list.head.next.next.val).to eq(4)
      expect(list.tail.val).to eq(4)
      expect(list.size).to eq(3)
    end

    it "deletes correctly at the end" do
      list.insert(1,2,3,4)
      list.delete_at_index(3)
      expect(list.head.next.next.next).to be_nil
      expect(list.tail.val).to eq(3)
      expect(list.size).to eq(3)
    end

    it "raises error when index is out of bound" do
      list.insert(1,2,3,4)
      expect { list.delete_at_index(10) }.to raise_error(IndexError)
    end
  end

  describe "#values" do
    it "returns values in order" do
      list.insert(1,2,3,4,5,6)
      expect(list.values).to eq([1,2,3,4,5,6])
    end
  end

  describe "#reverse_values" do
    it "returns values in reverse order" do
      list.insert(1,2,3,4,5,6)
      expect(list.reverse_values).to eq([1,2,3,4,5,6].reverse)
    end
  end
end
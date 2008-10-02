require File.dirname(__FILE__) + '/helper'

class MockTransport

  attr_accessor :sent, :recv

  def initialize
    @sent, @recv = [], []
  end

  def send_data(data)
    @sent << data
  end

  def receive_data(data)
    @recv << data
  end

end

describe 'object protocol sending an object' do

  before do
    @serializer = Marshal
    @trans = MockTransport.new
    @proto = ObjectProtocol.new(@trans, :send_data, @trans, :receive_data, @serializer)
  end

  should 'call the send method on the target object with a serialized object' do
    data = '1234567890'
    @proto.send_data(data)
    @trans.sent.first.should.eql(@serializer.dump data)
  end

end

describe 'sized header protocol receiving a frame' do

  before do
    @serializer = Marshal
    @trans = MockTransport.new
    @proto = ObjectProtocol.new(@trans, :send_data, @trans, :receive_data, @serializer)
  end

  should 'call the receive methd with the object when a whole object is read' do
    data = '1234567890'
    packet = @serializer.dump data
    @proto.receive_data(packet)
    @trans.recv.first.should.eql(data)
  end

end
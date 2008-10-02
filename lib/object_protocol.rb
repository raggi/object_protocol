class ObjectProtocol

  Version = '0.1.0'

  def self.version
    Version
  end

  attr_accessor :send_obj, :send_meth, :read_obj, :read_meth

  def initialize(send_obj, send_meth, read_obj, read_meth, serializer = Marshal)
    @send_obj, @send_meth = send_obj, send_meth
    @read_obj, @read_meth = read_obj, read_meth
    @serializer = serializer
  end

  def send_data(object)
    @send_obj.send @send_meth, @serializer.dump(object)
  end

  def receive_data(serialized)
    @read_obj.send @read_meth, @serializer.load(serialized)
  end

end
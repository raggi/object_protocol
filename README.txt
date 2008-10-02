object_protocol
    by James Tucker
    http://ra66i.org
    http://github.com/raggi/object_protocol

== DESCRIPTION:

An Object Protocol for ruby. Simply implements send and receive using a 
serializer that responds to #dump and #load. This protocol does not handle the 
"packetization" or framing of data. This should be performed by an external 
handler such as my sized_header_protocol.

== FEATURES/PROBLEMS:

* Simplicity.
* Accepts any serializer supporting #dump and #load.
* Part of the API feels a bit clunky when chaining.
* Needs it's documentation filling in.

== SYNOPSIS:

The following example is an example designed to run with EventMachine and 
sized_header_protocol. See the docs for sized_header_protocol for more 
information regarding the chaining api setup.

Provide any serializer supporting #dump and #load. Known options include:
* Marshal
* YAML
* JSON
I'm sure there must be others too.

  require 'rubygems'
  require 'eventmachine'
  require 'sized_header_protocol'
  require 'object_protocol'

  module Op

    def post_init
      @serializer = Marshal
      @packr = SizedHeaderProtocol.new(self, :send_data, nil, :receive_data)
      @proto = ObjectProtocol.new(@packr, :send_data, self, :receive_object, @serializer)
      @packr.read_obj = @proto
    end

    def receive_data(data)
      @packr.receive_data(data)
    end

    def send_object(object)
      @proto.send_data(object)
    end

    def receive_object(object)
      p object
      send_object(object.reverse)
    end

  end

  EM.run do

    EM.start_server '127.0.0.1', 8000, Op do |c|
      EM.add_timer(0.1) { c.send_object [:from, :server] }
    end

    EM.connect '127.0.0.1', 8000, Op do |c|
      EM.add_timer(0.1) { c.send_object [:from, :client] }
    end

    EM.add_timer(0.5) { EM.stop }

  end

Also, for further details or explanation, see the test (spec) suite.

== REQUIREMENTS:

* A packetization lib (sized_header_protocol)
* A transport system (eventmachine / packet / rev)
* Bacon for the spec suite.

== INSTALL:

* sudo gem install object_protocol

== LICENSE:

(The MIT License)

Copyright (c) 2008 James Tucker

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

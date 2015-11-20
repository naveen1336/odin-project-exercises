require 'socket'

server = TCPServer.open(2000)
loop do
  Thread.start(server.accept) do |client|
    client.puts(Time.now.ctime)
    sleep(2)
    client.puts("Closing the connection. Bye!")
    client.close
  end
end
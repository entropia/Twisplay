PORT = 2342

function init()
  uart.setup(0, 9600, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)
  s = net.createServer(net.TCP, 180)
  s:listen(2342, function(c)
    c:on("receive", function(c,l)
      uart.write(0, l)
    end)
  end)
  uart.write(0, "\27@")
  wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(t)
    uart.write(0, string.format("IP     %s\r\nPORT %d", t.IP, PORT))
  end)
end

init()

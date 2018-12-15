--Commands
COMM_INIT = "\27@"
COMM_CLR = "\12"
COMM_HOM = "\11"
COMM_CSR_OFF = "\31\67\00"
COMM_CSR_ON = "\31\67\01"

--Constants
PORT = 2342
ROW_LENGTH = 20

--State variables
first_msg = true

function info(ip, port)
  uart.write(0, COMM_CLR)
  uart.write(0, COMM_CSR_OFF)
  
  local sIP = "IP" 
  local sPORT = "PORT"
  local sPortNum = tostring(port)

  sIP = sIP .. string.rep(' ', ROW_LENGTH - #sIP - #ip) .. ip
  sPORT = sPORT .. string.rep(' ', ROW_LENGTH - #sPORT - #sPortNum) .. sPortNum
  uart.write(0, sIP .. sPORT)
  uart.write(0, COMM_HOM)
end

function init()
  --Initialize display
  uart.setup(0, 9600, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)
  uart.write(0, COMM_INIT)
  wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(t)
    info(t.IP, PORT)
  end)

  --Start tcp-server
  s = net.createServer(net.TCP, 180)
  s:listen(PORT, function(c)
    c:on("receive", function(c,l)
      --clear the info
      if first_msg then
        first_msg = false
        uart.write(0, COMM_CLR)
	uart.write(0, COMM_CSR_ON)
      end
      
      uart.write(0, l)
    end)
  end)
end

init()

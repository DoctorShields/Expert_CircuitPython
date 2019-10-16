import time
import board
import busio
from analogio import AnalogIn

uart = busio.UART(board.TX, board.RX, baudrate=9600)

analog_in = AnalogIn(board.A1)

def getAngle(val):
    return int(val/65536*180)

def sendVal(val):
    scaledVal = getAngle(val)
    uart.write(bytes([scaledVal]))
    time.sleep(.05)

while True:
    # potValue = getAngle(analog_in.value)
    for potVal in range(0,2**16-1,512):
        sendVal(potVal)
    for potVal in range(2**16-1,0,-512):
        sendVal(potVal)
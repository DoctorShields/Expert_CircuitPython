import time
import board
import busio
import pulseio
from adafruit_motor import servo
#from lcd.lcd import LCD
#from lcd.i2c_pcf8574_interface import I2CPCF8574Interface

#lcd = LCD(I2CPCF8574Interface(0x27), num_rows=2, num_cols=16)
uart = busio.UART(board.TX, board.RX, baudrate=9600)

pinArray = [board.D2, board.D3]
pwmList = []
for pin in pinArray:
    pwmList.append(pulseio.PWMOut(pin, duty_cycle=2**15,frequency=50))

servoList = []
for pwm in pwmList:
    servoList.append(servo.Servo(pwm))

#lcd.set_cursor_pos(0, 0)
#lcd.print("Waiting for")
#lcd.set_cursor_pos(1, 0)
#lcd.print("serial....")
s = ""

while True:
    data = uart.read(1)  # read a byte
    if data is not None:  # Data was received
        num = data.decode("utf-8")
        if(     num == "$"):
            arr = s.split("|")
            if len(arr) == 2:
                arr[0] = int(arr[0])
                arr[1] = int(arr[1])
                for i in range(0,1):
                    servoList[i].angle = arr[i];
                print(arr)
            s = ""
            #lcd.clear()
            #lcd.set_cursor_pos(0, 0)
            #lcd.print(str(arr[0]))
            #lcd.set_cursor_pos(1, 0)
            #lcd.print(str(arr[1]))
        else:
            s += num
        time.sleep(.01)











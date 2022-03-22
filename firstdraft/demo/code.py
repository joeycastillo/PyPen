import time
import board
import displayio
import framebufferio
import sharpdisplay
from digitalio import DigitalInOut, Direction, Pull
from adafruit_debouncer import Debouncer

extcomin = DigitalInOut(board.DISPLAY_EXTCOMIN)
extcomin.direction = Direction.OUTPUT
extcomin_value = False

enable = DigitalInOut(board.DISPLAY_ENABLE)
enable.direction = Direction.OUTPUT
enable.value = True

button_a = DigitalInOut(board.BTN_ALARM)
button_a.pull = Pull.UP
button_b = DigitalInOut(board.BTN_MODE)
button_b.pull = Pull.UP
button_c = DigitalInOut(board.BTN_LIGHT)
button_c.pull = Pull.UP

up = Debouncer(button_a)
down = Debouncer(button_b)
enter = Debouncer(button_c)

displayio.release_displays()
bus = board.SPI()
framebuffer = sharpdisplay.SharpMemoryFramebuffer(bus, board.DISPLAY_CS, 184 + 8, 38, baudrate=500000)
display = framebufferio.FramebufferDisplay(framebuffer)
display.show(None)

expression = ''
chars = '_1234567890/*-+.'
char = chars[0]

print(f' PyPen Calculator!\n {char}')

while True:
    up.update()
    down.update()
    enter.update()

    if up.fell:
        next_index = (chars.index(char) + 1) % len(chars)
        char = chars[next_index]
        print(f'\n {expression}{char}')
    if down.fell:
        next_index = (chars.index(char) + len(chars) - 1) % len(chars)
        char = chars[next_index]
        print(f'\n {expression}{char}')
    if enter.fell:
        if char == chars[0]:
            try:
                print(f' {expression}\n {eval(expression)}')
            except Exception as e:
                print(f' {expression}\n {e}')
            finally:
                expression = ''
                char = chars[0]
        else:
            expression = expression + char
            char = chars[0]
            print(f'\n {expression}{char}')

    # annoying: toggle extcomin manually. only necessary on a sharp memory display.
    extcomin_value = not extcomin_value
    extcomin.value = extcomin_value
    time.sleep(0.0076)

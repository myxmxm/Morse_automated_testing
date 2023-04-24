import serial

class MorseDecoderLibrary(object):
    ''' Library for interacting with morse sender and decoder
    '''
    
    def __init__(self, com_port_sender, com_port_decoder):
        self._sender = serial.Serial(com_port_sender, 115200, timeout = 1)
        self._decoder = serial.Serial(com_port_decoder, 115200, timeout = 20)

    # # Switche automatic WPM output on or off
    def set_automatic_wpm_print(self, status):
        self._decoder.write(bytes('wpm ' + status + '\n', 'utf-8'))

    # Switche immediate printing on or off
    def set_immediate_print(self, status):
        self._decoder.write(bytes('imm ' + status + '\n', 'utf-8'))

    def set_speed(self, speed):
        self._sender.write(bytes('wpm ' + speed + '\n', 'utf-8'))


    def send_text(self, text):
        self._decoder.reset_input_buffer()
        self._sender.write(bytes("text " + text + '\n', 'utf-8'))
        
    def speed_should_be(self, expected_speed, option):
        self._decoder.write(bytes('wpm' + '\n', 'utf-8'))
        text = self._decoder.readline().strip().decode('utf-8')
        speed = int(text.split()[2])

        upper_speed_limit = int(expected_speed) + int(expected_speed) * 0.1
        lower_speed_limit = int(expected_speed) - int(expected_speed) * 0.1

        if option == "Relaxed" :
            if lower_speed_limit >= speed and upper_speed_limit <= speed :
                raise AssertionError('Expected: ' + str(expected_speed) + ' got: '  + str(speed) + ' line: ' + text)
        else:
            if speed != int(expected_speed):
                raise AssertionError('Expected: ' + str(expected_speed) + ' got: '  + str(speed) + ' line: ' + text)


    def text_should_be(self, expected_text):
        text = self._decoder.readline().strip().decode('utf-8')
        if text != expected_text:
            raise AssertionError('Expected: ' + expected_text + ' got: ' + text)
  
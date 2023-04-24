*** Settings ***
Documentation     Setup, Teardown and Resources of morse transmitter test
...
...               Pass command line arguments
...               Move user keyword definition(s) to a resource file 
...               Modify test library to take two com ports as arguments 
...               Add suite setup that switches automatic WPM output and immediate printing off
...               Add suite teardown that switches WPM and immediate printing back on 	        
Resource		      morse.resource
Suite Setup       WPM And Immediate Print Switch    OFF
Suite Teardown	  WPM And Immediate Print Switch    ON

*** Test Cases ***
Morse Decode Text Only
    [Documentation]    This test only verify text content
    [Tags]             textOnly
    [Template]         Morse Decode Text Only
    How are you?
    ???some? text!!???
    &*&Hello!!!
    "this" is the last text!!!!!!!!!

Morse Decode Relaxed
    [Documentation]    This test accepts a margin of error of plus or minus 10% for WPM speed
    [Tags]             relaxed
    [Template]         Morse Decode Relaxed And Strick
    60    How are you?
    70    ???some? text!!???
    80    &*&Hello!!!
    85    "this" is the last text!!!!!!!!!

Morse Decode Strict
    [Documentation]    This test verify both text content and WPM speed
    [Tags]             strict
    [Template]         Morse Decode Relaxed And Strick
    60    How are you?                        Strick
    70    ???some? text!!???                  Strick
    80    &*&Hello!!!                         Strick
    85    "this" is the last text!!!!!!!!!    Strick
  

# Command line to execute:

# All tests 
# robot --variable com_port_sender:/dev/cu.usbmodemLQA1AQLQ2  --variable com_port_decoder:/dev/cu.usbmodem1303  morse.robot

# All but strict
# robot --exclude strict --variable com_port_sender:/dev/cu.usbmodemLQA1AQLQ2  --variable com_port_decoder:/dev/cu.usbmodem1303  morse.robot

# Text only
# robot --include textOnly --variable com_port_sender:/dev/cu.usbmodemLQA1AQLQ2  --variable com_port_decoder:/dev/cu.usbmodem1303  morse.robot
	

*** Settings ***
Documentation     Example of morse transmitter test
...
...               Change this example to use data driven style 
...               Test with different texts and speeds
...               Command “text hello, world!” will be received as “HELLOX WORLDX”.	 
Library           MorseDecoderLibrary.py  ${com_port_sender}  ${com_port_decoder}
Library           String
Library			  OperatingSystem

***Keywords***
WPM And Immediate Print Switch
    [Arguments]                ${Status}
    Set Automatic WPM Print    ${Status}
    Set Immediate Print        ${Status}
    Log to console             Set Automatic WPM Print and Immediate Print ${Status}

Transform Text
    [Arguments]          ${text}
    ${textRegex}         Replace String Using Regexp    ${text}    [^a-zA-Z0-9 ]    X
    ${upperTextRegex}    Convert To Uppercase    ${textRegex}
    [Return]             ${upperTextRegex}

Morse Decode Text Only
	[Arguments]         ${text}
	${transformedText}  Transform Text    ${text}		
    Send text           ${text}
	Text should be      ${transformedText}

Morse Decode Relaxed And Strick
	[Arguments]           ${speed}    ${text}    ${option}=Relaxed
	${transformedText}    Transform Text    ${text}		
	Set Speed             ${speed}
    Send text             ${text}
	Text should be        ${transformedText}
    Speed should be       ${speed}    ${option}
#!/bin/bash

# IDE_PATH=/Applications/MCUXpressoIDE_11.5.0_7232
start /wait /b cmd /c "$IDE_PATH/ide/binaries/boot_link2.cmd"

# MCUX_WORKSPACE_LOC=/Users/maxiaoming/Desktop/robot_framework/morse/morsesender
# MCUX_FLASH_DIR0=/Applications/MCUXpressoIDE_11.5.0_7232/ide/plugins/com.nxp.mcuxpresso.tools.bin.macosx_11.5.0.202112161150/binaries/Flash
# MCUX_IDE_BIN=/Applications/MCUXpressoIDE_11.5.0_7232/ide/plugins/com.nxp.mcuxpresso.tools.bin.macosx_11.5.0.202112161150/binaries/

# %MCUX_IDE_BIN%/crt_emu_cm_redlink --flash-load-exec "%MCUX_WORKSPACE_LOC%/MorseSender/Debug/MorseSender.axf" -p LPC1549 --ConnectScript LPC15RunBootRomConnect.scp --vc --probeserial LQA1AQLQ -CoreIndex=0 --flash-driver LPC15xx_256K.cfx -x %MCUX_WORKSPACE_LOC%/MorseSender/Debug --flash-hashing

# MCUX_WORKSPACE_LOC=/Users/maxiaoming/Desktop/robot_framework/morse/morsesender
MCUX_FLASH_DIR0=$IDE_BIN/Flash
MCUX_IDE_BIN=$IDE_BIN

$MCUX_IDE_BIN/crt_emu_cm_redlink --flash-load-exec "$MCUX_WORKSPACE_LOC/MorseSender/Debug/MorseSender.axf" -p LPC1549 --ConnectScript LPC15RunBootRomConnect.scp --vc --probeserial LQA1AQLQ -CoreIndex=0 --flash-driver LPC15xx_256K.cfx -x $MCUX_WORKSPACE_LOC/MorseSender/Debug --flash-hashing
#!/bin/bash

# open -a "mcuxpressoide"


# IDE_PATH=/Applications/MCUXpressoIDE_11.5.0_7232

# Path to the GNU tools and compiler: arm-none-eabi-gcc, ...
TOOLCHAIN_PATH="$IDE_PATH/ide/tools/bin"

# Path to the command line Eclipse IDE executable
IDE="$IDE_PATH/ide/MCUXpressoIDE.app/Contents/MacOS/mcuxpressoide"

echo "Extending PATH if not already present"
echo $PATH | grep -q "$TOOLCHAIN_PATH"
if [ $? -ne 0 ]
then
  export PATH="$PATH:$TOOLCHAIN_PATH"
fi

echo "Launching Eclipse IDE"

# Import projects into workspace
$IDE -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "." -importAll "."
# -cleanbuild on a build target: this does a 'clean' only on the build target followed by a build
$IDE -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "." -cleanBuild lpc_chip_15xx/Debug
$IDE -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "." -cleanBuild lpc_board_nxp_lpcxpresso_1549/Debug
$IDE -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "." -cleanBuild FreeRTOS/Debug
$IDE -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "." -cleanBuild MorseSender/Debug

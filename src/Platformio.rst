PlatformIO
==========

`PlatformIO <http://platformio.org/>`_ is a command line\ [1]_ and IDE based utility that allows you to write plain C or C++ code to upload to your Arduino, or, almost any other embedded microcontroller that is known to man, woman or hamster! At the time of writing, 5th July 2017, PlatformIO supported:

-   23 Development Platforms
-   13 Frameworks
-   412 Embedded Boards
-   61 Project Examples
-   1,738 Libraries
-   8,084 Library Examples

You can use it to replace the Arduino IDE too, if you wish, as it understands plain Arduino code as well as AVR C code. Arduino sketches can be imported unchanged, worked on, compiled and uploaded without any difficulty.

PlatformIO comes in two main flavours:

-   The command line version\ [2]_
-   An IDE version for the Atom editor, or Visual Studio. This also allows you to run the command line commands without having to install that package separately.

In addition, there's a lot of documentation on the web site about how you can install the PlatformIO tools into a large number of different IDEs, some of which you may already be using.

Installing Atom
---------------

**To Be COMPLETED**

Installing PlatformIO in Atom
-----------------------------

We will install the following 2 PlatformIO packages for Atom:

-   platformio-ide (version 2.0.0 beta 7 is the latest at the time of writing)
-   platformio-ide-debugger (version 1.2.3 is the latest at the time of writing)


Open Atom and select the ``edit -> Preferences`` menu option. When the 'Settings' tab appears, look down to find the option labelled '+ Install' and choose it.

Search for 'platformio' and a list of available options will soon be displayed. Find the two packages mentioned above and click the 'install' button. Wait ....

Eventually you will be prompted to restart Atom, so do so.

If, on the restart, you are prompted to `Install Clang` go ahead and do so, if you wish, or select ``Disable Code Completion``. Clang will have to be installed using your package manager - it's not a package for Atom but for the entire system. Full details are `here <http://docs.platformio.org/en/latest/ide/atom.html#ii-clang-for-intelligent-code-completion>`_.

Full instructions on installing Atom and PlatformIO packages can be found `here <http://docs.platformio.org/en/latest/ide/atom.html#clang-for-intelligent-code-completion>`_.

You will know that you have installed PlatformIO when you restart Atom and see a 'bug face' looking back at you from the PlatformIO welcome screen.

PlatformIO Quick Start
======================

Create the Blink Project
------------------------

Open the Atom editor, if not already running, and make sure that you can see the PlatformIO Welcome Screen. Click on '+ New Project' to start the New Project Wizard.

You must first select a board. As I'm using an Arduino Nano, for this example, that's what I'll be selecting. You may choose something different.

You will hopefully notice that when you have selected a board, you get to select another, and another .... this is a feature of PlatformIO in that it allows you to use the same source code for multiple boards and/or microcontrollers. Nice. I sometimes build for the Nano, the Uno, the Duemilenova and for the stand-alone AtTiny85.

For now, however, let's stick with a single board.

Now select a directory to save the code in. My choice is:

    ``/home/norman/SourceCode/PlatformIO/Blink``
    
you might want to choose something different, especially if you are on Windows!

Click the 'Process' button.

The first time PlatformIO is used, it needs to connect to the internet to install the appropriate tools for the board you have chosen. In the case of the Nano, this is 'platform: atmelavr'. Just wait ....

When the processing has completed, the output directory that you chose above will be populated by a number of files and directories:

-   Directory ``lib`` and a file, ``readme.txt`` within. The readme file has all the information you will need if you intend to write some libraries for this particular project. The source code for the libraries should be kept in this directory.
-   Directory ``src``. This is where you will create your own project's source code.
-   .gitignore. This (hidden on Linux) file tells git, if in use for version control, to ignore a number of files that are not required in normal circumstances, usually files that can be recreated at will.
-   .travis.yml. This (hidden on Linux) file is a YAML source file that tells the Travis 'Continuous Integration' system what to do whenever something in the project changes. We will not be using this feature.
-   platformio.ini. And finally, this file tells PlatformIO how the project will be built and uploaded to the microcontroller, for each board you selected when creating the project.

Write the Blink Code
--------------------

Now we have our project (Blink) created, we need to write some code, so:

-   Right-click the 'src' folder in the 'Project' tab, and select ``New File`` from the context menu that appears.
-   Enter the file name when prompted, I chose 'blink.c', but you can name the file as you wish.

The new file opens in the editor, so add the following code:

..  code-block:: c

    // Define the CPU speed, if not already defined.
    // My Nano is running at 16 MHz, so 16 million it shall be.
    // This allows the CPU to correctly set Baud rates, delays etc.
    //
    // This must also be done before anything else.
    #define F_CPU 16000000UL // 16 MHz clock speed

    // Pull in the header files for the AVR and the delay utilities. the
    // avr/io header will correctly pull in the appropriate other header file for
    // our chosen CPU. Neat!
    #include <avr/io.h>
    #include <util/delay.h>

    // The main code starts here. Always. Although main() appears to return an int
    // value, it never will because microcontrollers never exit from main().
    // The compiler might complain about it though, but it's only a warning.
    int main(void)
    {
      // SETUP goes here.
      DDRC = 0xFF; //Makes PORTC as Output

      // And here is what Arduino calls loop.
      while(1) //infinite loop
      {
        PORTC = 0xFF; //Turns ON All LEDs
        _delay_ms(1000); //1 second delay

        PORTC= 0x00; //Turns OFF All LEDs
        _delay_ms(1000); //1 second delay
      }
    }

Compile the Code
----------------

Save the file, ``File -> Save`` or Ctrl-S, then select ``PlatformIO -> Build`` or Ctrl-Alt-B to build the program. The compiler messages will appear, and then vanish after a couple of seconds. Click ``PlatformIO -> Toggle Build Panel`` or press F8 to display them again.

Check for Build Errors
----------------------

You will see something like the following:

..  code-block:: none

    Processing nanoatmega328 ...
    ------------------------------
    Verbose mode can be enabled via `-v, --verbose` option
    Collected 27 compatible libraries
    Looking for dependencies...
    Project does not have dependencies
    Compiling .pioenvs/nanoatmega328/src/blink.o
    
    src/blink.c:6:0: warning: "F_CPU" redefined

    #define F_CPU 16000000UL // 16 MHz clock speed
    ^
    <command-line>:0:0: note: this is the location of the previous definition
    
    Linking .pioenvs/nanoatmega328/firmware.elf
    Building .pioenvs/nanoatmega328/firmware.hex
    Calculating size .pioenvs/nanoatmega328/firmware.elf
    AVR Memory Usage
    ----------------
    Device: atmega328p
     
    Program:     178 bytes (0.5% Full)
    (.text + .data + .bootloader)
     
    Data:          0 bytes (0.0% Full)
    (.data + .bss + .noinit)
    ========================= [SUCCESS] Took 0.90 seconds =========================

It appears we have a slight problem, we have redefined F_CPU. PlatformIO knows that an Arduino Nano with an AtMega328 runs with a 16 MHz crystal, so it defines the correct speed for us. 

We can either:

-   delete the offending line of code in our ``blink.c`` file, or;
-   Wrap the code in sentinels, and only define it if it isn't already defined:

    ..  code-block:: c
    
        #ifndef F_CPU
        #define F_CPU 16000000UL // 16 MHz clock speed
        #endif

Then recompile. The warning should now go away. You might need to press F8 again to view the compiler output.

Gosh, Look How Small it is!
---------------------------

Look at the last few lines of the compiler output text:

..  code-block:: none

    AVR Memory Usage
    ----------------
    Device: atmega328p
     
    Program:     178 bytes (0.5% Full)
    (.text + .data + .bootloader)
     
    Data:          0 bytes (0.0% Full)
    (.data + .bss + .noinit)

This is telling you that the entire blink program takes up *only* 178 bytes of Flash Memory and zero bytes of data space (in the Dynamic RAM), on the Nano. What does it take up on an Arduino? Lets see:

..  code-block:: none

    Sketch uses 928 bytes (3%) of program storage space. Maximum is 30720 bytes.

    Global variables use 9 bytes (0%) of dynamic memory, leaving 2039 bytes ...

We have a huge saving in such a tiny program. Just out of interest, I compiled the BAreMinimum Arduino example, which looks like this:

..  code-block:: c

    void setup() {
      // put your setup code here, to run once:
    }

    void loop() {
      // put your main code here, to run repeatedly:
    }

And the compiler told me that:

..  code-block:: none

    Sketch uses 444 bytes (1%) of program storage space. Maximum is 30720 bytes.

    Global variables use 9 bytes (0%) of dynamic memory, leaving 2039 ...

So, our blink code, written in AVR C with none of the Arduino wrappings, takes up only 40% of the space used in Flash Memory by a completely empty\ [3]_ Arduino sketch!

Upload to Our Board
-------------------

Now that we have a clean build, we can upload it to our device. The first time we do this with an AVR device, Arduino etc, we will need to download the ``avrdude`` tool. This is what we need to program our device.

Select ``PlatformIO -> upload`` and wait...

Press F8 if the build information vanishes again.

You might see the following, on Linux:

..  code-block:: none

    Warning! Please install `99-platformio-udev.rules` and check that your board's PID and VID are listed in the rules.
    https://raw.githubusercontent.com/platformio/platformio/develop/scripts/99-platformio-udev.rules

This is required to allow non-root users on a Linux system, the ability to upload using the USB ports. 

Install the Rules File
~~~~~~~~~~~~~~~~~~~~~~

Download and install the rules file as follows:

..  code-block:: bash

    cd /tmp
    
    # The following is all on ONE LINE!
    sudo wget https://raw.githubusercontent.com/platformio/platformio/
    develop/scripts/99-platformio-udev.rules
    
    sudo cp 99-platformio-udev.rules /etc/udev/rules.d/99-platformio-udev.rules
    
    sudo service udev restart
    cd -
    
or, if that fails:

..  code-block:: bash

    sudo udevadm control --reload-rules
    sudo udevadm trigger
    cd -
    
Don't Forget Your Port


..  FOOTNOTES -------------------------------------------

..  [1] Panic not Windows users, the command line is not your mortal enemy. In fact, you can get stuff done a lot quicker in the command line, *most* of the time. Once you get to know it of course.
..  [2] See previous footnote!
..  [3] More on the reasons why elsewhere.
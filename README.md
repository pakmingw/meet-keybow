# meet-keybow
This is a [Pimoroni Keybow mini] https://shop.pimoroni.com/products/keybow-mini-3-key-macro-pad-kit?variant=27890390696019 Configuration for Google Meet.  You'll use it to implement physical audio mute, video mute, and fullscreen.

Here is a [sample video](https://photos.app.goo.gl/YcDdtqavQoTa7pj77) of the keybow mini in action.

Unlike the standard [Keybow OS] https://shop.pimoroni.com/products/raspberry-pi-zero-wh-with-pre-soldered-header, this guide will also install Keybow onto Raspbian, so you can ssh into the Keybow and also use it remotely.

Author: Pak Ming Wan, 2020.

## Requirements
1. A Pimoroni Keybow mini. 3 key programmable keyboard kit.
2. A Raspberry Pi Zero WH with an SD card with sufficient storage space for Raspbian, plus supporting tools.
3. A computer to run Google Meet (this code will work for Windows or Linux, and with MacOS X with some minor changes)

## Installation
1. Build the [Pimoroni](https://learn.pimoroni.com/tutorial/sandyj/assembling-keybow).
2. Flash [Raspbian OS](https://www.raspberrypi.org/software/) on to an SD card.
3. On `/boot` or the boot partition, enable ssh access by creating an empty file called ssh with `touch ssh`.  Add in a [wpa-supplicant](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md) file to configure your connection to your wifi connection.
4. Boot the Raspberry, ssh in using the standard pi account, and secure the password. Apt-get update / upgrade and secure the OS. Install git.
5. Clone the [Keybow Source Code](https://github.com/pimoroni/keybow-firmware) into the pi home directory (or someowhere safe). Build the source into the static linked binaries as per the instructions.
6. Configure Raspbian OS to enable the interfaces / interfaces installed by the Keybow Source Code.
7. Merge the config lines in `merge.config.txt` into the Raspbian `config.txt`
8. Enable the Raspbian modules to allow it to turn it into a USB HID keyboard. You can use the code below (or do it manually)

<code>pi@raspberrypi:~ $ echo "dwc2" | sudo tee -a /etc/modules</code>

<code>pi@raspberrypi:~ $ sudo echo "libcomposite" | sudo tee -a /etc/modules</code>

9. Check the `keys.lua` file to make sure it refers to the `layouts/mini_googlemeet.lua`.
10. Check `layouts/mini_googlemeet.lua` and configure the colours and keys for Mac OS if required.
11. Reboot the Raspberry. Ssh into it, and cd into `/boot` and run `sudo ./keybow`.
12. If it works, you can also create a service for the keybow with the file `keybow.service`. Follow [these instructions](https://www.raspberrypi.org/documentation/linux/usage/systemd.md) to setup the service and make it start on boot. It should looks like this:

<code>pi@raspberrypi:~ $ sudo cp keybow.service /etc/systemd/system/keybow.service</code>

<code>pi@raspberrypi:~ $ sudo systemctl start keybow.service</code>

<code>pi@raspberrypi:~ $ sudo systemctl stop keybow.service</code>

<code>pi@raspberrypi:~ $ sudo systemctl enable keybow.service</code>

Steps 8 to 12 are documented in `install.sh` if you want to copy and paste from a file rather than from this markdown text.
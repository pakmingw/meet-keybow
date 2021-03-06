# meet-keybow
This is a [Pimoroni Keybow mini](https://shop.pimoroni.com/products/keybow-mini-3-key-macro-pad-kit?variant=27890390696019) Configuration for Google Meet.  You'll use it to implement physical audio mute, video mute, and fullscreen.

Here is a [sample video](https://photos.app.goo.gl/YcDdtqavQoTa7pj77) of the meet-keybow mini in action.

Unlike the standard [Keybow OS](https://shop.pimoroni.com/products/raspberry-pi-zero-wh-with-pre-soldered-header), this guide will install Keybow onto a headless deployment of Raspbian, so you can ssh into the Keybow and update it remotely.

Pak Ming Wan, 2020.

## Requirements
1. A [Pimoroni Keybow mini](https://shop.pimoroni.com/products/keybow-mini-3-key-macro-pad-kit?variant=27890392039507). 3 key programmable keyboard kit. I have the clicky key version.
2. A [Raspberry Pi Zero WH](https://shop.pimoroni.com/products/raspberry-pi-zero-wh-with-pre-soldered-header) with an SD card with sufficient storage space for Raspbian, plus supporting tools (32Gb is perfectly fine, you'll need about 8Gb total).
3. A computer to run Google Meet (this code will work for Windows or Linux, and with MacOS X with some minor changes)

## Installation
1. Build the [Pimoroni Keybow mini](https://learn.pimoroni.com/tutorial/sandyj/assembling-keybow).
2. Flash [Raspbian OS](https://www.raspberrypi.org/software/) on to an SD card.
3. As the Raspberry wiill run headless, you'll need to get secure remote access to it via ssh. On `/boot` or the boot partition, enable ssh access by creating an empty file called ssh with `touch ssh`.  Add in a [wpa-supplicant](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md) file to configure your connection to your wifi connection.
4. Boot the Raspberry, ssh in using the standard pi account, and secure the password. Apt-get update `sudo apt-get update`, upgrade `sudo apt-get upgrade` to secure the OS. Install git with `sudo apt-get install git`.
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

## Animated Lights
I have provide a sample Octave script `generateImage.m` to generate a PNG image to animate the keybow. Alter the algorithms to your own taste. The sample shows RGB, with a slight colour shift. Change `keys.lua` to point at `mini_googlemeet_png` or `mini_googlemeet` to switch between fixed colors and this animated mode.
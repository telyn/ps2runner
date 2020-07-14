ps2runner
=========

Yo! I guess you're pretty passionate about testing, huh?

This is a docker image you can run on your raspberry pi, or other ARM/AMD64 computer. It allows you to boot and shutdown a Slim Playstation 2, as well as boot the PS2 into PS2Link (using one of the FreeMCBoot shortcut keys).

Prerequisites
=============

* An infrared transmitter, supported by LIRC, which is capable of transmitting at normal consumer remote-control frequencies (38khz of the top of my head?). I use an irdroid IRToy 2.
* A Playstation 2 you've already set up to run PS2Link - whether through FreeDVDBoot, FreeMCBoot, or some other method.

Usage
=====

```console
# to turn on your slim PS2:
docker run --rm --device /dev/ttyACM0 telyn/ps2runner ps2poweron
# to turn on your slim PS2 & boot into PS2Link:
# TODO: ps2bootlink should wait until `ps2client listen` reports that ps2link is ready ("EE: Cmd thread" appears)
docker run --rm --device /dev/ttyACM0 telyn/ps2runner ps2bootlink
# to turn off your slim PS2:
docker run --rm --device /dev/ttyACM0 telyn/ps2runner ps2poweroff
```

Available environment variables
-------------------------------

TODO:
* `LIRC_PLUGIN` - driver plugin for LIRC to use
* `PS2LINK_BUTTON` - button to hold to access PS2Link (defaults to L1)


FAQ
===

I guess you're pretty passionate about testing, huh?
----------------------------------------------------

Yeah.

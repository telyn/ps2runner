ps2runner
=========

Yo! I guess you're pretty passionate about testing, huh?

This is a docker image you can run on your raspberry pi, or other ARM/AMD64 computer. It allows you to boot and shutdown a Slim Playstation 2, as well as boot the PS2 into PS2Link (using one of the FreeMCBoot shortcut keys).

Prerequisites
=============

* An infrared transmitter, supported by LIRC, which is capable of transmitting at normal consumer remote-control frequencies (38khz of the top of my head?). I use an irdroid IRToy 2.
* A Playstation 2 you've already set up to run PS2Link by holding a button down
  during boot. You can do this with FreeMCBoot (at least) - detailed instructions
  on doing that will be below.

Usage
=====

The following usage examples assume you have an IRToy, like I do. Any IR
transceiver compatible with LIRC that runs at ~38khz should be usable - but
finding out what --device needs to be specified is left as something for you to
figure out.

```console
# to turn on your slim PS2:
docker run --rm --device /dev/ttyACM0 telyn/ps2runner ps2poweron
# to turn on your slim PS2 & boot into PS2Link. --network=host is needed to get
# PS2Link's bootup broadcast messages to show up in the container.
docker run --rm --network=host --device /dev/ttyACM0 telyn/ps2runner ps2bootlink

# to run an application on your already-booted PS2's EE:
docker run --rm --network=host telyn/ps2runner ps2run --ee
# to run an application on your already-booted PS2's IOP:
docker run --rm --network=host telyn/ps2runner ps2run --iop /path/to/some.irx
# to turn off your slim PS2:
docker run --rm --device /dev/ttyACM0 telyn/ps2runner ps2poweroff
```

All the IRX files included in the PS2 SDK in $PS2SDK/iop/irx are available in
/irx for loading `ps2run`. For example:
```
docker run telyn/ps2runner ps2run --iop /irx/alloc.irx
docker run -v /example:/example telyn/ps2runner ps2run --iop /example/something-that-depends-on-alloc.irx
```

See the ps2-cunit-port repo's gitlab-ci.yml and gitlab template for example usage of this container within a CPU pipeline.

Future work
===========

* Optionally split the LIRC daemon into its own docker container, allowing the
  daemon to be run persistently to avoid the LIRC start-up cost.

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

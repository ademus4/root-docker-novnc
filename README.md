# ROOT running with noVNC Display Container

Based on https://github.com/theasp/docker-novnc

## Image Contents

* [Xvfb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - X11 in a virtual framebuffer
* [x11vnc](http://www.karlrunge.com/x11vnc/) - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/) - a small window manager
* [socat](http://www.dest-unreach.org/socat/) - for use with other containers
* [xterm](http://invisible-island.net/xterm/) - to demo that it works
* [supervisord](http://supervisord.org) - to keep it all running

## Usage

### Variables

You can specify the following variables:
* `DISPLAY_WIDTH=<width>` (1024)
* `DISPLAY_HEIGHT=<height>` (768)
* `RUN_XTERM={yes|no}` (yes)
* `RUN_FLUXBOX={yes|no}` (yes)

### Stand-alone Demo
Run:
```bash
$ docker run --rm -it -p 8080:8080 root-docker-novnc
```
Open a browser and see the `xterm` demo at `http://<server>:8080/vnc.html`

# Thanks
___
This is based on the alpine container by @psharkey: https://github.com/psharkey/docker/tree/master/novnc
Based on [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker) and [octave-x11-novnc-docker](https://hub.docker.com/r/epflsti/octave-x11-novnc-docker/).

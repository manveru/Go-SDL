# Copyright 2009 The Go Authors.  All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

include $(GOROOT)/src/Make.$(GOARCH)

all: test-sdl test-gl

libs:
	make -C sdl install
	make -C gl install


test-sdl: test-sdl.go libs
	$(GC) test-sdl.go
	$(LD) -o $@ test-sdl.$(O)

test-gl: test-gl.go libs
	$(GC) test-gl.go
	$(LD) -o $@ test-gl.$(O)

clean:
	rm -f *.8 *.6 gl/*.6 gl/*.8 sdl/*.6 sdl/*.8 test-sdl test-gl shoot.png

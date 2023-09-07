#!/bin/bash

cd JTAG && \
    ./configure && \
    sbt 'runMain jtag.JTAG -config_file ../jtag-config.yml'
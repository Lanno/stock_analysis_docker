#!/bin/sh

if [ "$1" = "jupyterlab" ]; then
  cd /srv/stock_analysis_panel && make jupyterlab
else
  cd /srv/stock_analysis_panel && make serve
fi

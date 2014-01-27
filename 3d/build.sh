#!/bin/bash

for fn in psh02_02pg psh02_03pg psh02_04pg; do
  openscad -o _.stl $fn.scad > /dev/null
  meshconv -c stl -o $fn _.stl
done

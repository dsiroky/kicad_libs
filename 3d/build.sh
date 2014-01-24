#!/bin/bash

for fn in psh02 psh03 psh04; do
  openscad -o _.stl $fn.scad > /dev/null
  meshconv -c stl -o $fn _.stl
done

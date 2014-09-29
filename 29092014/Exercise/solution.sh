#!/bin/bash

# The first 6 lines of the file explain the format, which is	
# x = $2
# y = $5
# xmin, xmax = $3,$4
# sigma_y+ , sigma_y- = $6 , $7
# The first 11 lines do not contain data useful for us.
# So they must be excluded first

tail -n+12 rpp2012-pimp_total.dat | awk '{print $2,$5,$3,$4,$5-$7,$5+$6}' > filename1

tail -n+12 rpp2012-pipp_total.dat | awk '{print $2,$5,$3,$4,$5-$7,$5+$6}' > filename2

# The two datafiles can then be plotted

echo set terminal pdf > plot.gnu
echo set output \"foo.pdf\" >> plot.gnu
echo set logscale >> plot.gnu
echo plot \"filename1\" with xyerrorbars, \"filename2\" with xyerrorbars >> plot.gnu

gnuplot plot.gnu

evince foo.pdf


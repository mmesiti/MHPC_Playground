set terminal pdf
set output "foo.pdf"
set logscale
plot "filename1" with xyerrorbars, "filename2" with xyerrorbars

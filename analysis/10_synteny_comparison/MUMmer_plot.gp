set terminal x11 font "Courier,8"
set xtics rotate ( \
 "contig_1_pilon" 1.0, \
 "contig_2_pilon" 6996056.0, \
 "contig_3_pilon" 7166515.0, \
 "contig_4_pilon" 7717644.0, \
 "" 8772084 \
)
set ytics ( \
 "CP094298.1" 1.0, \
 "CP094299.1" 9368017.0, \
 "" 9660595 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:8772084]
set yrange [1:9660595]
set style line 1  lt 1 lw 2 pt 6 ps 1
set style line 2  lt 3 lw 2 pt 6 ps 1
set style line 3  lt 2 lw 2 pt 6 ps 1
plot \
 "MUMmer_plot.fplot" title "FWD" w lp ls 1, \
 "MUMmer_plot.rplot" title "REV" w lp ls 2

print "-- INTERACTIVE MODE --"
print "consult gnuplot docs for command list"
print "mouse 1: coords to clipboard"
print "mouse 2: mark on plot"
print "mouse 3: zoom box"
print "'h' for help in plot window"
print "enter to exit"
pause -1

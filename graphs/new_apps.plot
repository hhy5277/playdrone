set terminal pdf dashed size 6,3
set output "new_apps.pdf"

#set title "Apps Released and Removed on the Market"
set key horizontal

set ylabel "Number of Apps" offset +1, 0
set xlabel "Day" offset 0,+0.2
set grid y

# set xdata time
# set timefmt "%m/%d/%y"
# set xrange [ "04/26/13":"06/22/13" ]
#set xrange [ "04/27/13":"05/07/13" ]

# set timefmt "%s"
# set format x "%a, %d %b"

# set xtics nomirror rotate by -10
set yrange [-5000:6000]

set xtics 5
set xrange [0:57]


set style fill solid border -1
set boxwidth 1 absolute

set ytics 1000

set xzeroaxis lw 5 lt -1

set datafile missing

plot 'new_apps.dat' using 1:($2)    lt 1 lc 2 with boxes fs solid 0.6 t "Added", \
                 '' using 1:(-$3)   lt 1 lc 1 with boxes fs solid 0.6 t "Removed", \
                 '' using 1:($4)    lt 1 lc 13 lw 5 with lines t "Updated", \
                 '' using 1:($2-$3) lt 1 lc 3 lw 5 with lines t "Net Added"

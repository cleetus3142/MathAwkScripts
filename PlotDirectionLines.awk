# Program to generate direction lines and print them out
# In Gnuplot, first set the axes to equal gradations:
# set size ratio -1
# Then use: plot "DirectionField.dat" using 1:2:3:4 with vectors head filled lt 2
# https://stackoverflow.com/questions/5442401/vector-field-using-gnuplot
# in Gnuplot to plot the direction field
# As far as I can tell, gnuplot can only plot vector fields when
# reading data from a file. Your file will have to have 4 columns,
# x, y, deltax and delta y, and gnuplot will then plot a vector from
# (x,y) to (x+deltax, y+deltay) for each line in the file:
# To run this program do:
# $ awk -f PlotDirectionLines.awk > DirectionField.dat
#
# This awk script computes the direction field for the differential 
# equation    dy/dx - y


BEGIN { digits = "^[0-9]+$"
        print "Enter the final x and y values\n"
}

{
    if (($1 ~ digits) && ($2 ~ digits))
        for (j=0; j <= $1; j++) {
            # Here dx of dy/dx is incremented by 0.1
            dx=0.1
            for (i=0; i <= $2; i++) {
                # Here dy increases as y gets bigger.
                # We are using dy/dx = y 
                dy=0.1*i
                print j "\t" i "\t" dx "\t" dy
            }
        }
    else
        print "You must enter an ineteger"

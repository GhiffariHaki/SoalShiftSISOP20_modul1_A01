#!/bin/bash

#Soal Nomor 1.A
echo "Region dengan profit paling sedikit adalah :"
awk 'BEGIN{ FS = "\t" }{ZZZ[$13] += $(NF)}
END{for(i in ZZZ) { print "-" i, ZZZ[i];}}' /home/haki/Downloads/Sample* | sort -n | head -1
echo " " #Biar rapi
echo " "
#
#
#Soal Nomor 1.B
echo "2 State dalam Region Central dengan profit paling sedikit adalah :"
awk 'BEGIN{ FS = "\t" } /Central/{ZZZ[$11] += $(NF)}
END{for(i in ZZZ) { print "-" i, ZZZ[i];}}' /home/haki/Downloads/Sample* | sort -n | head -2
echo " " #Biar rapi
echo " "
#
#
#Soal Nomor 1.C
echo "10 Produk dengan profit paling sedikit dalam"
echo "Region Central dan State California/Illinois adalah :"
awk 'BEGIN{ FS = "\t" }/Central/ { if( $11 == "California" || $11 = "Illinois" ){ZZZ[$17] += $(NF)}}
END{for(i in ZZZ) { print "-" i, ZZZ[i];}}' /home/haki/Downloads/Sample* | sort -n | head -10


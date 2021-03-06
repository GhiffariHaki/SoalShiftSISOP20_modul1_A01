# SoalShiftSISOP20_modul1_A01

Mochamad Haikal Ghiffari -  05111840000095
Nikodemus Siahaan - 05111840000151

# Soal Nomor 1
Source code : [soal1.sh](https://github.com/GhiffariHaki/SoalShiftSISOP20_modul1_A01/blob/master/soal1/soal1.sh)

A. Dalam Bagian ini, kami mencari Region dengan profit paling sedikit

```
awk 'BEGIN{ FS = "\t" }{ZZZ[$13] += $(NF)}
END{for(i in ZZZ) { print "-" i, ZZZ[i];}}' /home/haki/Downloads/Sample* | sort -n | head -1
```
- `awk 'BEGIN{ FS = "\t" }` : Menandakan file awk dimulai dengan File Separator "tab"
- `{ZZZ[$13] += $(NF)}` : Membuat suatu variabel yang menambahkan duplicate row di $13 dengan isi data tabel terakhir/NF
- `END{for(i in ZZZ) { print "-" i, ZZZ[i];}}` : Sebagian besar program sudah selesai, kita akan menampilkan output sesuai dengan distinct
value dalam Column Region
- `/home/haki/Downloads/Sample*` : Lokasi file yang diproses
- `sort -n | head -1` : Array di sort dari terkecil ke terbesar lalu ambil head (dari awal) sebanyak 1 data (-1)

B. Dalam Bagian ini, Kami mencari 2 State dengan profit terkecil berdasarkan hasil a

```
awk 'BEGIN{ FS = "\t" } /Central/{ZZZ[$11] += $(NF)}
END{for(i in ZZZ) { print "-" i, ZZZ[i];}}' /home/haki/Downloads/Sample* | sort -n | head -2
```
- `awk 'BEGIN{ FS = "\t" }` : Menandakan file awk dimulai dengan File Separator "tab"
- `/Central/` : "{  }" selanjutnya menggunakan syarat dalam suatu kolom dalam rownya ada "Central"
- `{ZZZ[$11] += $(NF)}` : Membuat suatu variabel yang menambahkan duplicate row di $11 dengan isi data tabel terakhir/NF
- `END{for(i in ZZZ) { print "-" i, ZZZ[i];}}'` : Sebagia besar program sudah selesai, kita akan menampilkan output sesuai dengan distinct
value dalam Column State dengan Region Central
- `/home/haki/Downloads/Sample*` : Lokasi file yang diproses
- `sort -n | head -2` : Array di sort dari terkecil ke terbesar lalu ambil head (dari awal) sebanyak 2 data (-2)

C. Dalam Bagian ini, Kami mencari 10 Produk dengan profit terkecil berdasarkan hasil b

```
awk 'BEGIN{ FS = "\t" }/Central/ { if( $11 == "California" || $11 = "Illinois" ){ZZZ[$17] += $(NF)}}
END{for(i in ZZZ) { print "-" i, ZZZ[i];}}' /home/haki/Downloads/Sample* | sort -n | head -10
```
- `awk 'BEGIN{ FS = "\t" }` : Menandakan file awk dimulai dengan File Separator "tab"
- `/Central/` : "{  }" selanjutnya menggunakan syarat dalam suatu kolom dalam rownya ada "Central"
- `{ if( $11` == "California || $11 = "Illinois" ) : California dan Illinois merupakan hasil dari soal 1.B
- `{ZZZ[$17] += $(NF)}}` : Membuat suatu variabel yang menambahkan duplicate row di $11 dengan isi data tabel terakhir/NF
- `END{for(i in ZZZ) { print "-" i, ZZZ[i];}}` : Sebagia besar program sudah selesai, kita akan menampilkan output sesuai dengan distinct
value dalam Column State dengan Region Central
- `/home/haki/Downloads/Sample*` : Lokasi file yang diproses
- `sort -n | head -10` : Array di sort dari terkecil ke terbesar lalu ambil head (dari awal) sebanyak 10 data (-10)

Hasil dari program adalah sebagai berikut :
![Untitled_sisop1](https://user-images.githubusercontent.com/57068224/75025949-a49d7480-54ce-11ea-9dca-d4d1c1962019.png)

# Soal Nomor 2
Bagian C Source Code :[dekripsi.sh](https://github.com/GhiffariHaki/SoalShiftSISOP20_modul1_A01/blob/master/soal2/dekripsi.sh)
Bagian D Source Code :[enkripsi.sh](https://github.com/GhiffariHaki/SoalShiftSISOP20_modul1_A01/blob/master/soal2/enkripsi.sh)

# Bagian A dan B
Source Code : [nomor2a2b.sh](https://github.com/GhiffariHaki/SoalShiftSISOP20_modul1_A01/blob/master/soal2/Nomor2a2b.sh)

`password=$(head /dev/urandom`
// Untuk membuat random

`| tr -dc A-Za-z0-9 |`
// membuat karakter huruf besar,kecil , dan angka

`head -c 28 | head -n 1)`
// membuat karakter hanya sebatas 28 karakter

```
while true; do
   read -r -p "Masukkan String: " nama
   if [[ $nama =~ ^[A-Za-z]+$ ]];then
      fname="$nama.txt"
      echo "$password" > "$fname"
      break
   else
      echo "nama file error."
   fi
done
```
Membuat kondisi agar nama file yang diinput hanya berupa alphabet dan berekstensi txt . Apabila tidak memenuhi akan terjadi peringatan error dan kembali memasukkan nama strring. jika memenuhi akan langsung tercipta file dan berisi password acak 28 karakter

# Bagian C
konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah.
```
#!/bin/bash

sebelum="${1%.*}"

hour=`date "+%H"`

key1=`expr $hour + 98`
key2=`expr $hour + 97`

chr() {
  printf "\\$(printf '%03o' "$1")"
}

up=`chr $key1`
down=`chr $key2`

setelah=`printf "$sebelum" | tr b-zaB-ZA $up-za-$down${up^^}-ZA-${down^^}`

mv $sebelum.txt $setelah.txt
```
->  sebelum="${1%.*}"
// agar .txt tidak ikut terenkripsi

-> hour=`date "+%H"
// untuk membuat variable hour dengan yg saat ini

-> key1=`expr $hour + 98`
key2=`expr $hour + 97
//batas atas dan batas bawah pada saat translate

->chr() {
  printf "\\$(printf '%03o' "$1")"
}
// mengubah ASCI ke valuenya

-> up=`chr $key1`
down=`chr $key2`
// untuk variabel up dan down

->setelah=`printf "$sebelum" | tr b-zaB-ZA $up-za-$down${up^^}-ZA-${down^^}`
mv $sebelum.txt $setelah.txt
//Setiap huruf dalam sebelum akan dibaca dan terjadi pergantian huruf sesuai dengan format translate (b-zaB-ZA) yang sudah diganti dengan hasil dari up dan down sesuai dengan format jam. Hasilnya akan disimpan di variabel 'setelah' dan hasil enkripsnya menjadi di 'setelah'

# Bagian D
```
#!/bin/bash

sebelum="${1%.*}"

change=`stat --printf="%z" $sebelum.txt`

time=`echo "$change" | awk -F ' ' '{ print $2 }'`

hour=`echo "$time" | awk -F ':' '{ print $1 }'`

key1=`expr $hour + 98`
key2=`expr $hour + 97`

chr() {
  printf "\\$(printf '%03o' "$1")"
}

up=`chr $key1`
down=`chr $key2`

setelah=`printf "$sebelum" | tr $up-za-$down${up^^}-ZA-${down^^} b-zaB-ZA`

mv $sebelum.txt $setelah.txt
```
//Variabel 'change' digunakan untuk menyimpan waktu last change pada file untuk mengetahui jam berapa nama file terakhir diganti
//Variabel 'time' digunakan untuk mengambil jam dari variabel 'change' karena pada variabel tersebut terdapat informasi yang tidak diperlukan. Di-cut menggunakan awk dengan field separator ' ' dan diprint pada argumen 2.
//Variabel 'hour' digunakan untuk mengambil jamnya saja pada variabel 'time' agar nama file bisa didekripsi.

# SoalShiftSISOP20_modul1_A01

Mochamad Haikal Ghiffari -  05111840000095
Nikodemus Siahaan - 05111840000

#Soal Nomor 1
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
password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 | head -n 1)

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

if [ ! -d "files" ]; then
    mkdir "files"
fi

yourName="misha"

lastFile=$(ls -1 "files" | grep "^$yourName" | sed -n 's/^'$yourName'\([0-9]*\)$/\1/p' | sort -n | tail -n 1)
if [ -z "$lastFile" ]; then
    lastFile=0
fi

for ((i = 1; i <= 25; i++)); do
    ((lastFile++))
    filename="$yourName$lastFile"
    touch "files/$filename"
done

echo "Created 25 files in 'files'."

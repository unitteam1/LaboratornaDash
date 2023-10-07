if [ $# -ne 3 ]; then
    echo 
    exit 1
fi

directory="$1"
original_extension="$2"
new_extension="$3"

for file in "$directory"/*."$original_extension"; do
    if [ -e "$file" ]; then
        filename=$(basename -- "$file")
        filename_no_ext="${filename%.*}"

        new_filename="$directory/$filename_no_ext.$new_extension"

        mv "$file" "$new_filename"
        echo "Rename from $file to $new_filename"
    fi
done
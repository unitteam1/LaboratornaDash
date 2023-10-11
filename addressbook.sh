address_file="addressbook.txt"

if [ ! -e "$address_file" ]; then
    touch "$address_file"
fi

case "$1" in
    new)
        name="$2"
        email="$3"
        echo "$name $email" >> "$address_file"
        echo "Додано запис: $name $email"
        ;;

    list)
        if [ -s "$address_file" ]; then
            cat "$address_file"
        else
            echo "адресна книга порожня"
        fi
        ;;

    remove)
        name="$2"
        grep -v "^$name " "$address_file" > "$address_file.tmp"
        mv "$address_file.tmp" "$address_file"
        ;;

    clear)
        > "$address_file"
        ;;

    lookup)
        name="$2"
        grep "^$name " "$address_file" | cut -d' ' -f2
        ;;
    *)
        echo "Використання: ./addressbook [new|list|remove|clear|lookup] [параметри...]"
        exit 1
        ;;
esac

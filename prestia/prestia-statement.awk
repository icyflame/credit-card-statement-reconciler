BEGIN {
    FS=","
}

{
    if (NR == 1) {
        next
    }

    # $1 = yyyy/mm/dd
    # Let's convert it to a format that we can work with
    num_components = split($1, a, "/")

    if (num_components != 3) {
        next
    }

    printf("%s %s %s %s\n", a[1], a[2], a[3], $6)
}

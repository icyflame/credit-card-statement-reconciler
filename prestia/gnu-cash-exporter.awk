BEGIN {
    FS=";"
}

{
    if (NR == 1 || (NR+1) % 3 != 0) {
        next
    }

    # date = mm/dd/yyyy
    date=$1;
    num_components = split(date, a, "/")

    if (num_components != 3) {
        next
    }

    # Remove the minus sign from the value if it exists
    gsub("-", "", $13)

    # Remove the comma from the value if it exists
    gsub(",", "", $13)

    printf("%s %s %s %s\n", a[3], a[1], a[2], $13)
}

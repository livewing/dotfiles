NR == 2 {
    total = $1 / 1024 / 1024
    used = $2 / 1024 / 1024
}
END {
    rate = used / total * 100
    printf "%.2f / %.2f GB (%.1f %%)\n", used, total, rate
}

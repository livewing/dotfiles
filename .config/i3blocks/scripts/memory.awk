$1 == "MemAvailable:" {
    available = $2 / 1024 / 1024
}
$1 == "MemTotal:" {
    total = $2 / 1024 / 1024
}
END {
    used = total - available
    rate = used / total * 100
    printf "%5.2f / %5.2f GB (%4.1f %%)\n", used, total, rate
}

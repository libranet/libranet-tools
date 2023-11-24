# https://github.com/microsoft/WSL/issues/8204

update_clock () {
    echo '[ROOT] Updating clock (sudo hwclock --hctosys)'
    sudo hwclock -s
    sudo ntpdate time.windows.com
}


update_clock



# dnf install system-timesyncd
timedatectl status

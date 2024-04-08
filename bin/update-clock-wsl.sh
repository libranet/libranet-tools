# https://github.com/microsoft/WSL/issues/8204

update_clock () {
    echo '[ROOT] Updating clock (sudo hwclock --hctosys)'
    sudo hwclock -s
    sudo ntpdate time.windows.com
}


update_clock



# dnf install system-timesyncd
timedatectl status


# sudo yum install chrony
# sudo systemctl start chronyd
# sudo systemctl enable chronyd
# sudo chronyd -q 'server 0.centos.pool.ntp.org iburst'
# chronyc tracking

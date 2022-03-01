w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org"
w32tm /config /reliable:yes
net stop w32time
net start w32time

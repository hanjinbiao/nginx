#!/bin/bash

case $1 in

start)
	/usr/local/nginx/sbin/nginx;;

stop)

	/usr/local/nginx/sbin/nginx -s stop;;

status)

	num=`pgrep nginx | wc -l`

	if [ $num -ne 0 ];then
		echo -e "\033[32mNginx is Running\033[0m"
	else
		echo -e "\033[31mNginx Not Running\033[0m"
	fi;;
reload)

	/usr/local/nginx/sbin/nginx -s reload;;

restart)

	/usr/local/nginx/sbin/nginx -s stop
	sleep 0.2
	/usr/local/nginx/sbin/nginx;;
enable)
	echo "/usr/local/nginx/sbin/nginx" >> /etc/rc.d/rc.local
	chmod +x /etc/rc.d/rc.local;;
disable)
	sed -i '/nginx$/d' /etc/rc.d/rc.local;;
check)
	/usr/local/nginx/sbin/nginx -t;;
*)

	echo "输入错误，您可以使用$0 
[start|stop|status|reload|restart|enable|disable|check]"
esac

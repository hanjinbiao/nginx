#!/bin/bash
Yum(){
	echo -e "\033[31mYum源未安装，接下来将为您安装Yum\033[0m"
    read -p "请输入Yum源地址:" YumUrl
    rm -rf /etc/yum.repos.d/*.repo
    echo "[development]
name=rhel7
baseurl=$YumUrl
enabled=1
gpgcheck=0" > /etc/yum.repos.d/development.repo
}
Check_Yum(){
	YumCheck=`yum repolist | sed -n '/repolist/p'|awk -F: '{print $2}'|sed 's/,//'`
	while [ $YumCheck -eq 0 ]
	do
		Yum
		yum clean all &> /dev/null
		YumCheck=`yum repolist | sed -n '/repolist/p'|awk -F: '{print $2}'|sed 's/,//'`
		if [ $YumCheck -ne 0 ];then
			echo -e "\033[31mYum源检测正常\033[0m"
			exit 0
		fi
	done
}
#检测是否配置yum
yum clean all &> /dev/null
YumCheck1=`yum repolist &> /dev/null`
if [ $? -ne 0 ];then
   Yum
fi
Check_Yum 


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
	yum clean all &> /dev/null
	YumCheck2=`yum repolist | sed -n '/repolist/p'|awk -F: '{print $2}'|sed 's/,//'`
	if [ $YumCheck2 -eq 0 ];then
    	Yum
	else
    	echo -e "\033[31mYum已配置完成，请使用\033[0m"
	fi
}
#检测是否配置yum
yum clean all &> /dev/null
YumCheck1=`yum repolist &> /dev/null`
if [ $? -ne 0 ];then
    Yum
fi
YumCheck2=`yum repolist | sed -n '/repolist/p'|awk -F: '{print $2}'|sed 's/,//'`
if [ $YumCheck2 -eq 0 ];then
    Yum
	Check_Yum
else
    echo -e "\033[31mYum源检测正常\033[0m"
fi


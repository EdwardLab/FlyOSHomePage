#!/data/data/com.termux/files/usr/bin/bash
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "FlyOS安装程序正在启动..." 6 60 0
　　
whiptail --title "FlyOS Installer" --msgbox " 欢迎使用FlyOS安装向导，单击OK开始安装FlyOS，体验极客生活！" 10 60
whiptail --title "安装询问" --msgbox " 确定安装FlyOS？安装FlyOS操作系统会删除所有程序及数据(包括用户文档和文件等)" 10 60
echo "安装将会清除所有数据, 请确认已备份重要数据"
read -p "按下回车继续" _
echo "[*] 安装依赖"
echo deb http://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main > $PREFIX/etc/apt/sources.list
apt update -y
apt install wget git -y
echo "[*] 下载文件"
rm -rf $PREFIX/tmp/flyos.tar.gz
wget --show-progress -q "https://xingyujie-my.sharepoint.com/:u:/g/personal/xingyujie_xingyujie_onmicrosoft_com/EcDbV36nCkpGnAN3iee7MesBhRmwZG-Rbv_UGboZrPvtXQ?e=9lKdeR&download=1" -O $PREFIX/tmp/flyos.tar.gz
echo "[*] 解压文件"
cd $PREFIX/../
tar -zxvf $PREFIX/tmp/flyos.tar.gz --recursive-unlink --preserve-permissions
echo "[*] 更新系统"
cd $PREFIX/etc/flyos
git checkout dev
git pull
pip install -r requirements.txt
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "安装结束，系统自动退出，请稍后" 6 60 0
　　
pkill bash

#!/data/data/com.termux/files/usr/bin/bash
echo "安装将会清除所有数据, 请确认已备份重要数据"
read -p "按下回车继续" _
echo "[*] 安装依赖"
echo deb http://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main > $PREFIX/etc/apt/sources.list
apt update -y
apt install wget git -y
echo "[*] 下载文件"
rm -rf $PREFIX/tmp/flyos.tar.gz
wget --show-progress -q "http://files.flyosgeek.com/rootfs/flyos_4.4.tar.gz" -O $PREFIX/tmp/flyos.tar.gz
echo "[*] 解压文件"
cd $PREFIX/../
tar -zxvf $PREFIX/tmp/flyos.tar.gz --recursive-unlink --preserve-permissions
echo "[*] 更新系统"
cd $PREFIX/etc/flyos
git checkout dev
git pull
pip install -r requirements.txt
echo "[+] 安装完成, 请重启termux"

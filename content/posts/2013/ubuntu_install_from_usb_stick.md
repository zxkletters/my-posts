Title: 从USB安装ubuntu  
Date: 2013-08-27 10:50  
Author: zxkletters  
Slug: install_ubuntu_from_usb_stick  
Category: tech  

今天通过usb安装ubuntu系统时遇到的小问题，记录下。

按照[官网](http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows "create usb stick")的文档
制做好usb stick(通过[Universal-USB-Installer-1.9.3.9.exe](http://www.pendrivelinux.com/universal-usb-installer-easy-as-1-2-3/)
软件，将ubuntu iso文件flush到usb)，将usb插入电脑并在bios里设置通过usb启动后，电脑一直处于黑屏状态。
后来在[ubuntu社区](http://askubuntu.com/search?page=2&tab=relevance&q=boot%20from%20usb%20not%20work)查找解决办法
发现了一个帖子[Installing Ubuntu with USB stick](http://askubuntu.com/questions/313910/installing-ubuntu-with-usb-stick/313914#313914),
提到这个软件[Rufu](http://rufus.akeo.ie/)可以解决. 最后按照该贴用Rufu制作的usb stick成功安装。

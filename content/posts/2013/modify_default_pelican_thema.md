Title: 修改pelican默认的theme
Author: zxkletters
Date: 2013-09-04 20:48
Slug: modify_pelican's_default_theme

按照pelican的[getting started文档](http://docs.getpelican.com/en/3.2/getting_started.html)，使用  
*pelican-quickstart* 命令生成 _web site_ 后, 目录中没有任何的theme，*make html*  
生成静态的html后,会发现web site已经使用了默认的theme.

一般默认的theme放在python安装目录的site-packages里，也可能在dist-packages目录里。  
查找方法：  

1. 确认python版本  

    python -V

2. 查找themes所在目录  

    sudo find . -name themes -type d | grep python2.7  

(*我的python版本是2.7.3*)   
查找结果：

   ./usr/local/lib/python2.7/dist-packages/pelican-3.2.2-py2.7.egg/pelican/themes，  

这个目录里有两个子目录:notmyidea, simple.  
3. 复制notmyidea到其他目录(比如~/pelican/default_theme)，这个目录就是*make html*时使用的默认theme.  

4. 修改pelican的*pelicanconf.py*文件，增加theme配置项:  

    THEME = "~/pelican/default_theme"
5. 修改~/pelican/default_theme/templates/base.html文件，重新执行下*make html*看下，生成的  
静态html页面应该改变了

Title: 通过命令行快速浏览你的文件系统  
Date: 2013-08-29 11:07  
Category: tech  
Slug: quickly-navigate-your-filesystem  
Author: zxkletters


原文:[Quickly navigate your filesystem from the command-line](http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html)

复制下边的代码到~/.bashrc文件里:


    export MARKPATH=$HOME/.marks  
    function jump { 
        cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
    }
    function mark { 
        mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
    }
    function unmark { 
        rm -i "$MARKPATH/$1"
    }
    function marks {
        ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
    }
    _completemarks() {
      local curw=${COMP_WORDS[COMP_CWORD]}
      local wordlist=$(find $MARKPATH -type l -printf "%f\n")
      COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
      return 0
    }
    
    complete -F _completemarks jump unmark


好了，可以试下：

    $cd ~/test/mydocs
 
进入~/test/mydocs目录,执行

    $mark docs
    
然后回到用户目录:

    $cd

执行下边的命令，看下发生了什么

    $jump docs




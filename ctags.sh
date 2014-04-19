#!/bin/bash

#在当前目录下生成tags文件，并在~/.vimrc中自动加入载入当前tags的语句

#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . 


_opt=$1
if [ $# -ne 1 ] || [ "$_opt" != "create" ] && [ "$_opt" != "rm" ];then
	echo "Usage: `basename $0` \"create/rm\""
	exit 1
fi


if [ "$_opt" = "create" ];then

	ctags -R --fields=+lS

	#如果找到~/.vimrc中找到匹配行，则不追加
	grep "`pwd`/tags" ~/.vimrc > /dev/null

	if [ "$?" = 0 ];then
		echo "文件 ~/.vimrc中已包含当前tags"
		exit 1	
	else
		#追加新的tags到 ~/.vimrc
		echo "set tags+=`pwd`/tags" >> ~/.vimrc
		echo "\"set tags+=`pwd`/tags\" 已被加入 ~/.vimrc"
	fi

fi


if [ "$_opt" = "rm" ];then
	rm -f tags
	_str="`pwd`"
	_str2="`basename $_str`"		#找出当前的目录名
	
	sed  '/'"$_str2"'/d' ~/.vimrc > ~/.vimrc.tmp #删除匹配本目录的行，不严谨可能会误删除行,因为没有匹配绝对路径
	mv -f ~/.vimrc.tmp ~/.vimrc
	echo "\"set tags+=`pwd`/tags\" 已从 ~/.vimrc中删除 ..."
fi

拖入多个文件数量在一定150-190以上就不一定能读取 (猜测原因为拖入路径+文件名后显示的名称太长导致)

经过测试确定是文件路径+文件名太长导致可以拖入的文件数量有限
	for %%F in (*.pdf) do call :main "%%F" 将bat文件和bin文件架一并放置目标目录

多文件，文件名含有右括号不行 
	(*.pdf,%*) 多文件类型解决

自动文件夹内所有pdf的话，文件名带空格也不行 
	"%%F"加双引号解决 或删除 cd /D "% ~dp0" 

直接拖入文件名不含右括号的文件后，会自动点读取被拖入文件的根目录中所有文件
cd /D "%dp0"
for %%F in (*.pdf,%*) do call :main "%%F"
goto :eof

解决带空格带括号和两种都带的情况
REM https://stackoverflow.com/questions/36988501/batch-script-fails-on-filenames-with-parenthesis#
cd /D "%~dp0"
set "AAA=%*"
set "AAA=%AAA:^=^^%"
set "AAA=%AAA:&=^&%"
set "AAA=%AAA:(=^(%"
set "AAA=%AAA:)=^)%"
for %%F in (%AAA%) do call :main %%F
goto :eof

可以在命令提示符下使用的字符串的最大长度为 8191 个字符。
微软官方文档
https://docs.microsoft.com/en-us/troubleshoot/windows-client/shell-experience/command-line-string-limitation

The maximum length of the string that you can use at the command prompt is 8191 characters. This limitation applies to: the command line. individual environment variables that are inherited by other processes, such as the PATH variable.2021年9月23日

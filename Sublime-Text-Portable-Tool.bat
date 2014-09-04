@echo OFF

title Sublime Text 便携版工具包

echo.

echo.               Sublime Text 便携版工具包 说  明 @LOO2K

echo -----------------------------------------------------------------------

echo   操作序号：

echo   1: 添加 Sublime Text 到系统右键菜单;

echo   2: 卸载 Sublime Text 右键菜单;

echo   3: 注册扩展名; (扩展名列表请存放至同目录的 ext.txt 文件中)

echo   4: 卸载扩展名：

echo   5: 退出;

echo.

echo   注意事项：

echo   1. 请将此脚本复制到 Sublime Text 的文件夹；

echo   2. 确保 Sublime Text 的可执行文件名为 sublime_text.exe；

echo   3. 请将需要绑定的扩展名保存到同目录 ext.txt 文件中；（每行一个扩展名）

echo.

echo -----------------------------------------------------------------------

:begin

Set /p u=输入操作序号并按 Enter 键：



If "%u%" == "1" Goto regMenu

If "%u%" == "2" Goto unregMenu

If "%u%" == "3" Goto st2file

If "%u%" == "4" Goto unst2file

If "%u%" == "5" exit

If "%u%" == ""  Goto begin



:regMenu

REG ADD HKEY_CLASSES_ROOT\*\shell\SublimeText /t REG_SZ /d "Open with Sublime Text" /f
REG ADD HKEY_CLASSES_ROOT\*\shell\SublimeText\Command /t REG_SZ /d "%cd%\sublime_text.exe \"%%1\"" /f
REG ADD HKEY_CLASSES_ROOT\*\shell\SublimeText /v Icon /t REG_SZ /d "%cd%\sublime_text.exe,0 " /f
REG ADD HKEY_CLASSES_ROOT\Directory\shell\SublimeText /t REG_SZ /d "Open with Sublime Text" /f
REG ADD HKEY_CLASSES_ROOT\Directory\shell\SublimeText\Command /t REG_SZ /d "%cd%\sublime_text.exe -n \"%%1\"" /f
REG ADD HKEY_CHKEY_CLASSES_ROOT\Directory\shell\SublimeText /v Icon /t REG_SZ /d "%cd%\sublime_text.exe,0 " /f

echo.

echo 已成功注册右键菜单

echo.

Goto begin



:unregMenu

REG DELETE HKEY_CLASSES_ROOT\*\shell\SublimeText /f
REG DELETE HKEY_CLASSES_ROOT\Directory\shell\SublimeText /f

echo.

echo 已成功卸载右键菜单

echo.

Goto begin



:st2file

reg add "HKCR\st2file" /ve /d "文本文档" /f

reg add "HKCR\st2file\DefaultIcon" /ve /d "%cd%\sublime_text.exe,0 " /f

reg add "HKCR\st2file\shell\open\command" /ve /d "%cd%\sublime_text.exe \"%%1\"" /f

For /F "eol=;" %%e in (ext.txt) Do (

        Rem echo %%e

        (for /f "skip=2 tokens=1,2,* delims= " %%a in ('reg query "HKCR\.%%e" /ve') do (

            If NOT "%%c" == "st2file" (

                reg add "HKCR\.%%e" /v "st2_backup" /d "%%c" /f

            )

        ))

        assoc .%%e=st2file

    )

echo.

echo 已成功注册扩展名

echo.

Goto begin



:unst2file

reg delete "HKCR\st2file" /f

For /F "eol=;" %%e in (ext.txt) Do (

        Rem echo %%e

        (for /f "skip=2 tokens=1,2,* delims= " %%a in ('reg query "HKCR\.%%e" /v "st2_backup"') do (

            reg add "HKCR\.%%e" /ve /d "%%c" /f

            reg delete "HKCR\.%%e" /V "st2_backup" /f

        ))

    )

echo.

echo 已成功卸载扩展名

echo.

Goto begin


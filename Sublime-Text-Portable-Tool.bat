@echo OFF

title Sublime Text ��Я�湤�߰�

echo.

echo.               Sublime Text ��Я�湤�߰� ˵  �� @LOO2K

echo -----------------------------------------------------------------------

echo   ������ţ�

echo   1: ��� Sublime Text ��ϵͳ�Ҽ��˵�;

echo   2: ж�� Sublime Text �Ҽ��˵�;

echo   3: ע����չ��; (��չ���б�������ͬĿ¼�� ext.txt �ļ���)

echo   4: ж����չ����

echo   5: �˳�;

echo.

echo   ע�����

echo   1. �뽫�˽ű����Ƶ� Sublime Text ���ļ��У�

echo   2. ȷ�� Sublime Text �Ŀ�ִ���ļ���Ϊ sublime_text.exe��

echo   3. �뽫��Ҫ�󶨵���չ�����浽ͬĿ¼ ext.txt �ļ��У���ÿ��һ����չ����

echo.

echo -----------------------------------------------------------------------

:begin

Set /p u=���������Ų��� Enter ����



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

echo �ѳɹ�ע���Ҽ��˵�

echo.

Goto begin



:unregMenu

REG DELETE HKEY_CLASSES_ROOT\*\shell\SublimeText /f
REG DELETE HKEY_CLASSES_ROOT\Directory\shell\SublimeText /f

echo.

echo �ѳɹ�ж���Ҽ��˵�

echo.

Goto begin



:st2file

reg add "HKCR\st2file" /ve /d "�ı��ĵ�" /f

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

echo �ѳɹ�ע����չ��

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

echo �ѳɹ�ж����չ��

echo.

Goto begin


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
::http://www.computerhope.com/forum/index.php?topic=54333.0
setlocal
cd /d %~dp0 
:begin

Set /p u=���������Ų��� Enter ����



If "%u%" == "1" Goto regMenu

If "%u%" == "2" Goto unregMenu

If "%u%" == "3" Goto st2file

If "%u%" == "4" Goto unst2file

If "%u%" == "5" exit

If "%u%" == ""  Goto begin



:regMenu

reg add "HKCR\*\shell\Sublime Text 2" /ve /d "Open With Sublime Text" /f

reg add "HKCR\*\shell\Sublime Text 2\command" /ve /d "%cd%\sublime_text.exe ""%%1""" /f

echo.

echo �ѳɹ�ע���Ҽ��˵�

echo.

Goto begin



:unregMenu

reg delete "HKCR\*\shell\Sublime Text 2" /f

echo.

echo �ѳɹ�ж���Ҽ��˵�

echo.

Goto begin



:st2file

reg add "HKCR\st2file" /ve /d "�ı��ĵ�" /f

reg add "HKCR\st2file\DefaultIcon" /ve /d "%cd%\sublime_text.exe" /f

reg add "HKCR\st2file\shell\open\command" /ve /d "%cd%\sublime_text.exe ""%%1""" /f

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


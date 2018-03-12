
if exist C:\CRM\apache-tomcat-9.0.5\bin\startup.bat SET apppath=C:\CRM\
if exist D:\CRM\apache-tomcat-9.0.5\bin\startup.bat SET apppath=D:\CRM\
if exist E:\CRM\apache-tomcat-9.0.5\bin\startup.bat SET apppath=E:\CRM\
if exist F:\CRM\apache-tomcat-9.0.5\bin\startup.bat SET apppath=F:\CRM\
if exist G:\CRM\apache-tomcat-9.0.5\bin\startup.bat SET apppath=G:\CRM\
if exist H:\CRM\apache-tomcat-9.0.5\bin\startup.bat SET apppath=H:\CRM\

if exist J:\CRM\apache-tomcat-9.0.5\bin\startup.bat SET apppath=J:\CRM\
if exist K:\CRM\apache-tomcat-9.0.5\bin\startup.bat SET apppath=K:\CRM\
echo %apppath%

REM start C:\wamp64\wampmanager.exe
REM timeout /t 10 /nobreak
REM CALL "E:\CRM\apache-tomcat-9.0.5\bin\startup.bat"

start %apppath%\UwAmp\UwAmp.exe
setx CATALINA_HOME "%apppath%\apache-tomcat-9.0.5" /M

setx JAVA_HOME "%apppath%\jdk1.8.0_161_x86" /M
setx JRE_HOME "%apppath%\jdk1.8.0_161_x86" /M
REM timeout /t 8 /nobreak	
REM timeout /t 1 /nobreak
CALL "%apppath%\apache-tomcat-9.0.5\bin\startup.bat"
pause
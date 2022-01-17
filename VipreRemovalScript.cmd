@echo off
setlocal
setlocal EnableDelayedExpansion 

echo #####################################################
echo #                                                   #
echo #       VIPRE Business Removal Tool v0.2.3          #
echo #                                                   #
echo #            Last update: Jan 24, 2020              #
echo #    Source Instructions: https://bit.ly/2R4ekIi    #
echo #         (Instructions update regularly)           #
echo #                                                   #
echo #####################################################
echo .
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
echo THE SOFTWARE.
echo.
REM set /p AREYOUSURE="Have you read, understand, and agree to the disclaimer? [y/N] "
REM IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

set LOGFILE="%temp%\VIPRE_MsiUninstall.log"
REM set UTF8 output in next line
REM chcp 65001
REM CMD /U /C type "Starting VIPRE removal script" > %LOGFILE%
CMD /U /C type nul > %LOGFILE%
echo VIPRE removal script running. > %LOGFILE%

REM in reverse order for easier adding from the Vipre support site (see link in header)

set "GUIDarr[41]=C8E10C87-6B09-4049-89E5-D491262577A4" REM Vipre 12.0.7873 ES
set "GUIDarr[41]=BEEF1ABD-B362-4EC6-A106-9E858E2C08CD" REM Vipre 10.0.6290 ES
set "GUIDarr[40]=1E44E54A-7060-4D86-B987-CEE8FC6A39DE" REM Vipre 10.0.6288 ES
set "GUIDarr[39]=285887A9-D309-4D76-A934-345CA891F5EC" REM Vipre 10.0.6286 ES
set "GUIDarr[38]=8E94C826-08F4-45AF-B225-E120BE227C0B" REM Vipre 9.6.6194 S
set "GUIDarr[37]=A0428E33-FC8A-45AF-BFAC-D2E2A4B4E0A4" REM Vipre 9.6.6194 P
set "GUIDarr[36]=070BA5FF-CB66-4376-B088-0E0234310DCF" REM Vipre 9.6.6194 ES
set "GUIDarr[35]=7495E9C8-564D-4B31-97D6-840AF37D205C" REM Vipre 9.6.6190 ES
set "GUIDarr[34]=C5A52260-126B-44C4-BAB6-A23D73CB8F62" REM Vipre 9.5.6159 S
set "GUIDarr[33]=3F0F54DF-836C-43D3-A1AF-AB4A4905B224" REM Vipre 9.5.6159 P
set "GUIDarr[32]=01C0B63C-D9E2-496E-B500-FEB4E0F6A1E4" REM Vipre 9.5.6159 ES
set "GUIDarr[31]=7158DDCA-1459-4002-BB76-622BFE138B89" REM Vipre 9.5.6154 S
set "GUIDarr[30]=4070DFC4-DFB3-4F15-B78F-49B14A6357BF" REM Vipre 9.5.6154 P
set "GUIDarr[29]=EF078905-EA54-4E34-929E-28A75445F04D" REM Vipre 9.5.6154 ES
set "GUIDarr[28]=3945FDDF-3F01-45C5-98F3-483CA13DA7BE" REM Vipre 9.3.6032 S
set "GUIDarr[27]=30D65515-CCD4-4CAF-AC61-836539CB2A63" REM Vipre 9.3.6032 P
set "GUIDarr[26]=D10CB7F9-53B4-4ABD-936F-AA93CD1D9C65" REM Vipre 9.3.6032 ES
set "GUIDarr[25]=C6AB2467-7C8B-4523-A18C-C466049DBA4C" REM Vipre 9.3.6030 S
set "GUIDarr[24]=345888D4-199F-48D1-A89C-694B48F2F5A3" REM Vipre 9.3.6030 P
set "GUIDarr[23]=1D9E6C77-07CA-43B1-9A25-BF4FA0EA8758" REM Vipre 9.3.6030 ES
set "GUIDarr[22]=077A97DD-E63E-4A4F-B39C-E1111AA9E151" REM Vipre 9.3.6012 S
set "GUIDarr[21]=28090F18-50E3-4AE6-B258-D27DEC2404D9" REM Vipre 9.3.6012 P
set "GUIDarr[20]=3D81A81B-477F-4D0D-8B3C-599E032CF283" REM Vipre 9.3.6012 ES
set "GUIDarr[19]=2B43966F-3C72-4D34-AB5A-2D35F5320C4C" REM Vipre 9.3.6000 Standard
set "GUIDarr[18]=0C92648E-DC79-4A1E-A63A-FA7492E8CDA7" REM Vipre 9.3.6000 Premium
set "GUIDarr[17]=2645C2A8-4700-46F9-B2F7-A0E826DBCF91" REM Vipre 9.3.6000 Endpoint Security
set "GUIDarr[16]=56CA3334-8B72-48D1-81E7-3EF5243E45D5" REM Vipre 7.5.5841 Premium
set "GUIDarr[15]=8B2C9073-C948-4033-93EF-E7F781E43E35" REM Vipre 7.5.5839 Standard
set "GUIDarr[14]=1BDEA9D9-7988-4BC2-8DE3-2AE4B6E65969" REM Vipre 7.5.5839 Premium
set "GUIDarr[13]=82FB46C5-494D-41A8-81C4-E2CC094169BE" REM Vipre 7.0.5725 Standard
set "GUIDarr[12]=BAA1CAE8-8E7B-4000-AC56-38AC8BB7506A" REM Vipre 7.0.5725 Premium
set "GUIDarr[11]=CC1CEA69-B7AF-47EE-AB64-68B7A1E2F3CF" REM Vipre 7.0.5711 Standard
set "GUIDarr[10]=D685DD76-77A3-4661-B9F0-7DAE2D651260" REM Vipre 7.0.5711 Premium
set "GUIDarr[9]=B0783CD0-27C6-49B4-9905-AC3A6437F5A8" REM Vipre 7.0.5685 Standard
set "GUIDarr[8]=9CE81981-648E-4C9D-AC2F-6B129071903F" REM Vipre 7.0.5685 Premium
set "GUIDarr[7]=628B718E-65C3-47C8-B4C8-A86CA1B42F69" REM Vipre 7.0.5666 Standard
set "GUIDarr[6]=6A68DC82-9FFD-41EB-91BA-86A4CECF29C0" REM Vipre 7.0.5666 Premium
set "GUIDarr[5]=092D4B8A-D0BA-4D2D-A690-78357FEBBC38" REM Vipre 6.2.5537 Standard
set "GUIDarr[4]=3DF87105-29CA-4F06-9ACC-1745AFE49555" REM Vipre 6.2.5537 Premium
set "GUIDarr[3]=39A086B2-07D6-430B-AE5E-B8AC1CC843A7" REM Vipre 6.2.5530 Standard
set "GUIDarr[2]=E10809C0-E65F-4493-A31B-3F86DB6E9E2A" REM Vipre 6.2.5530 Premium
set "GUIDarr[1]=9D544611-F437-4153-913E-91CE036583CC" REM Vipre 6.0.5481 and 6.0.5482 Standard and Premium
set "GUIDarr[0]=39A086B2-07D6-430B-AE5E-B8AC1CC843A7" REM Vipre all earlier versions

set "ProductFeatureArr[0]=06225A5CB6214C44AB6B2AD337BCF826" REM unknown version
set "ProductFeatureArr[1]=0C90801EF56E39443AB1F368BDE6E9A2" REM unknown version
set "ProductFeatureArr[2]=116445D9734F351419E319EC305638CC" REM unknown version
set "ProductFeatureArr[3]=18918EC9E846D9C4CAF2B621091709F3" REM unknown version
set "ProductFeatureArr[4]=2B680A936D70B034EAE58BCAC18C347A" REM unknown version
set "ProductFeatureArr[5]=33E8240AA8CFFA54FBCA2D2E4A4B0E4A" REM unknown version
set "ProductFeatureArr[6]=3709C2B8849C330439FE7E7F184EE353" REM unknown version
set "ProductFeatureArr[7]=4333AC6527B81D84187EE35F42E3545D" REM unknown version
set "ProductFeatureArr[8]=4CFD07043BFD51F47BF8941BA43675FB" REM unknown version
set "ProductFeatureArr[9]=4D888543F9911D848AC996B4842F5F3A" REM unknown version
set "ProductFeatureArr[10]=50178FD3AC9260F4A9CC7154FA4E5955" REM unknown version
set "ProductFeatureArr[11]=509870FE45AE43E429E9827A45540FD4" REM unknown version
set "ProductFeatureArr[12]=51556D034DCCFAC4CA16385693BCA236" REM unknown version
set "ProductFeatureArr[13]=5C64BF28D4948A14184C2ECC901496EB" REM unknown version
set "ProductFeatureArr[14]=628C49E84F80FA542B521E02EB22C7B0" REM unknown version
set "ProductFeatureArr[15]=67DD586D3A7716649B0FD7EAD2562106" REM unknown version
set "ProductFeatureArr[16]=7642BA6CB8C732541AC84C6640D9ABC4" REM unknown version
set "ProductFeatureArr[17]=77C6E9D1AC701B34A952FBF40AAE7885" REM unknown version
set "ProductFeatureArr[18]=7C7B0FB5837462E43A5715DD34BB234F" REM unknown version
set "ProductFeatureArr[19]=81F090823E056EA42B852DD7CE42409D" REM unknown version
set "ProductFeatureArr[20]=86C7FB6C68544E4488001493060A827C" REM unknown version
set "ProductFeatureArr[21]=8A2C546200749F642B7F0A8E62BDFC19" REM unknown version
set "ProductFeatureArr[22]=8C9E5947D46513B4796D48A03FD702C5" REM unknown version
set "ProductFeatureArr[23]=8EAC1AABB7E80004CA6583CAB87B05A6" REM unknown version
set "ProductFeatureArr[24]=96AEC1CCFA7BEE74BA46867B1A2E3FFC" REM unknown version
set "ProductFeatureArr[25]=9D9AEDB188972CB4D83EA24E6B6E9596" REM unknown version
set "ProductFeatureArr[26]=9F7BC01D4B35DBA439F6AA39DCD1C956" REM unknown version
set "ProductFeatureArr[27]=A45E44E1060768D49B78EC8ECFA693ED" REM unknown version
set "ProductFeatureArr[28]=ACDD851795412004BB6726B2EF31B898" REM unknown version
set "ProductFeatureArr[29]=B18A18D3F774D0D4B8C395E930C22F38" REM unknown version
set "ProductFeatureArr[30]=C21346408A6123D4299DD1D723899DC1" REM unknown version
set "ProductFeatureArr[31]=C36B0C102E9DE6945B00EF4B0E6F1A4E" REM unknown version
set "ProductFeatureArr[32]=C928BABD4AA3D694D99624F210BD8691" REM unknown version
set "ProductFeatureArr[33]=DBA1FEEB263B6CE41A60E958E8C280DC" REM unknown version
set "ProductFeatureArr[34]=DD79A770E36EF4A43BC91E11A19A1E15" REM unknown version
set "ProductFeatureArr[35]=E84629C097CDE1A46AA3AF47298EDC7A" REM unknown version
set "ProductFeatureArr[36]=F66934B227C343D4BAA5D2535F23C0C4" REM unknown version
set "ProductFeatureArr[37]=FD45F0F3C6383D341AFABAA494502B42" REM unknown version
set "ProductFeatureArr[38]=FDDF549310F35C54893F84C31AD37AEB" REM unknown version
set "ProductFeatureArr[39]=FF5AB07066BC67340B88E0204313D0FC" REM unknown version

echo =========================================
echo Step 1: Running MsiExec /x on known GUIDs

set "x=0"
:msiexecloop
if defined GUIDarr[%x%] (
    start /wait MsiExec.exe /x !GUIDarr[%x%]! /quiet /l*+ %LOGFILE% REMOVE=ALL
    set /a "x+=1"
    GOTO :msiexecloop
)

echo Done.
echo ======================================
echo Step 2: Stopping and deleting services

set "servicearr[0]=GFIARK"
set "servicearr[1]=GFIUTIL"
set "servicearr[2]=SBAMSvc"
set "servicearr[3]=SBAPHD"
set "servicearr[4]=SBAPIFS"
set "servicearr[5]=SBEMI"
set "servicearr[6]=SBFW"
set "servicearr[7]=SBFWIMCL"
set "servicearr[8]=SBFWIMCLMP"
set "servicearr[9]=SBHIPS"
set "servicearr[10]=SBPIMSVC"
set "servicearr[11]=SBRE"
set "servicearr[12]=SBTIS"
set "servicearr[13]=SBWTIS"
set "servicearr[14]=VipreEdgeProtection"


set "x=0"
:serviceloop
if defined servicearr[%x%] (
    echo Stopping service !servicearr[%x%]! >> %LOGFILE%
    start /wait SC stop !servicearr[%x%]! >> %LOGFILE% 2>&1
      if not ErrorLevel 0 (
        echo "   egarr[%x%]!" >> %LOGFILE% 2>&1
        reg delete "!regarr[%x%]!" /f >> %LOGFILE% 2>&1
      )
    echo Deleting service !servicearr[%x%]! >> %LOGFILE%
    start /wait SC delete !servicearr[%x%]! >> %LOGFILE% 2>&1
    set /a "x+=1"
    GOTO :serviceloop
)


echo Done.
echo ===============================================
echo Step 3: Removing registry entries if they exist

set "x=0"
:regGUIDloop
if defined GUIDarr[%x%] (
    set "regGUIDarr[%x%]=HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\{!GUIDarr[%x%]!}"
    set "regGUIDarr[%x%]=HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{!GUIDarr[%x%]!}"
    set /a "x+=1"
    GOTO :regGUIDloop
)
REM the following is a one-off registry entry that is a GUID but Vipre support does not include the GUID in their list
set "regGUIDarr[%x%]=HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\{C1D1FC57-3EB9-4B21-BCA3-F1C927508200}"
set /a "x+=1"
set "regGUIDarr[%x%]=HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{C1D1FC57-3EB9-4B21-BCA3-F1C927508200}"
REM now the list of registry entries that are not GUIDs
set "regNonGUIDarr[0]=HKLM\Software\Sunbelt Software\Sunbelt Enterprise Agent"
set "regNonGUIDarr[1]=HKLM\Software\Wow6432Node\Sunbelt Software\Sunbelt Enterprise Agent"
set "regNonGUIDarr[2]=HKLM\Software\GFI Software\GFI Business Agent"
set "regNonGUIDarr[3]=HKLM\Software\Wow6432Node\GFI Software\GFI Business Agent"
set "regNonGUIDarr[4]=HKLM\Software\GFI Software\Deployment"
set "regNonGUIDarr[5]=HKLM\Software\Wow6432Node\GFI Software\Deployment"
set "regNonGUIDarr[6]=HKLM\Software\SBAMsvc"
set "regNonGUIDarr[7]=HKLM\Software\Wow6432Node\SBAMsvc"
set "regNonGUIDarr[8]=HKLM\Software\SBAMSvcVolatile"
set "regNonGUIDarr[9]=HKLM\Software\Wow6432Node\SBAMSvcVolatile"
set "regNonGUIDarr[10]=HKLM\Software\Vipre Business Agent"
set "regNonGUIDarr[11]=HKLM\Software\Wow6432Node\Vipre Business Agent"
set "regNonGUIDarr[12]=HKLM\Software\GFI\LNSS10"
set "regNonGUIDarr[13]=HKLM\SoftwareWow6432Node\GFI\LNSS10"

REM put them all together in regarr
set "x=0" REM for big loop, regarr
set "n=0" REM for iterating the little loops regGUIDarr and regNonGUIDarr
:regInsertGUIDloop
if defined regGUIDarr[%n%] (
  set "regarr[%x%]=!regGUIDarr[%n%]!"
  set /a "x+=1"
  set /a "n+=1"
  GOTO :regInsertGUIDloop
)
set "n=0" REM for iterating the little loops regGUIDarr and regNonGUIDarr
:regInsertNonGUIDloop
if defined regNonGUIDarr[%n%] (
  set "regarr[%x%]=!regNonGUIDarr[%n%]!"
  set /a "x+=1"
  set /a "n+=1"
  GOTO :regInsertNonGUIDloop
)
set "n=0"
:regInsertProductFeatureLoop
if defined ProductFeatureArr[%n%] (
  REM calling x+=1 multiple times in this loop only iterates once INSIDE although it counts them all once the loop exits. hack is x1 x2 x3 etc
  set "regarr[%x%]=HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\!ProductFeatureArr[%n%]!"
  call set /a "x1=x+1"
  set "regarr[%x1%]=HKLM\Software\Classes\Installer\Features\!ProductFeatureArr[%n%]!"
  set /a "x2=x+2"
  set "regarr[%x2%]=HKLM\Software\Classes\Installer\Products\!ProductFeatureArr[%n%]!"
  set /a "x3=x+3"
  set "regarr[%x3%]=HKCR\Installer\Products\!ProductFeatureArr[%n%]!"
  set /a "x4=x+4"
  set "regarr[%x4%]=HKCR\Installer\Features\!ProductFeatureArr[%n%]!"
  set /a "x=x+5"
  set /a "n+=1"
  GOTO :regInsertProductFeatureLoop
)

REM now delete the registry keys
set "x=0"
:regDeleteLoop
if defined regarr[%x%] (
  GOTO :regDoDelete
)
GOTO :afterRegDeleteLoop
:regDoDelete
echo Querying key !regarr[%x%]! >> %LOGFILE%
  reg query "!regarr[%x%]!" >> %LOGFILE% 2>&1
    if not ErrorLevel 1 (
      echo "Key found. Deleting key !regarr[%x%]!" >> %LOGFILE% 2>&1
      reg delete "!regarr[%x%]!" /f >> %LOGFILE% 2>&1
  )
  set /a "x+=1"
PING localhost -n 1 -w 100 >NUL REM - required pause here to allow SET to finish - otherwise it often causes a race with reg query errors
  REM returnto loop (this label should only be called from in the loop)
GOTO :regDeleteLoop

:afterRegDeleteLoop

echo Done.
echo =======================================
echo Step 4: Unregistering SBAMScanShell.dll
 
set "InstallLocation[0]=C:\Program Files\VIPRE Business Agent\"
set "InstallLocation[1]=C:\Program Files\GFI Software\Deployment\"
set "InstallLocation[2]=C:\Program Files\GFI Software\GFIAgent\"
set "InstallLocation[3]=C:\Program Files\GFI Software\LanGuard 10\"
set "InstallLocation[4]=C:\Program Files\Sunbelt Software\Deployment\"
set "InstallLocation[5]=C:\Program Files\Sunbelt Software\SBEAgent\"
set "InstallLocation[6]=C:\Program Files (x86)\VIPRE Business Agent\"
set "InstallLocation[7]=C:\Program Files (x86)\GFI Software\Deployment\"
set "InstallLocation[8]=C:\Program Files (x86)\GFI Software\GFIAgent\"
set "InstallLocation[9]=C:\Program Files (x86)\GFI Software\LanGuard 10\"
set "InstallLocation[10]=C:\Program Files (x86)\Sunbelt Software\Deployment\"
set "InstallLocation[11]=C:\Program Files (x86)\Sunbelt Software\SBEAgent\"
set "InstallLocation[12]=C:\ProgramData\VIPRE Business Agent\"
set "InstallLocation[13]=C:\ProgramData\GFI Software\Antimalware\"
set "InstallLocation[14]=C:\ProgramData\GFI Software\LanGuard 10\"
set "InstallLocation[15]=C:\ProgramData\Sunbelt Software\Antimalware\"
set "InstallLocation[16]=C:\Documents and Settings\All Users\Application Data\VIPRE Business Agent\"
set "InstallLocation[17]=C:\Documents and Settings\All Users\Application Data\GFI Software\Antimalware\"
set "InstallLocation[18]=C:\Documents and Settings\All Users\Application Data\GFI Software\LanGuard 10\"
set "InstallLocation[19]=C:\Documents and Settings\All Users\Application Data\Sunbelt Software\Antimalware\"


set "x=0"
:unregisterSBAMloop
if defined InstallLocation[%x%] (
  echo CD "!InstallLocation[%x%]!" >> %LOGFILE% 2>&1
  CD "!InstallLocation[%x%]!" >> %LOGFILE% 2>&1
  PING localhost -n 1 -w 100 >NUL
  RegSvr32 /u SBAMScanShellExt.dll /s >> %LOGFILE% 2>&1
  set /a "x+=1"
  PING localhost -n 1 -w 100 >NUL
  GOTO :unregisterSBAMloop
)
 
echo Done.
echo ================================================
echo Step 5: Removing folders and files if they exist

set "FolderLocation[0]=C:\Program Files\VIPRE Business Agent\"
set "FolderLocation[1]=C:\Program Files\GFI Software\Deployment\"
set "FolderLocation[2]=C:\Program Files\GFI Software\GFIAgent\"
set "FolderLocation[3]=C:\Program Files\GFI Software\LanGuard 10\"
set "FolderLocation[4]=C:\Program Files\Sunbelt Software\Deployment\"
set "FolderLocation[5]=C:\Program Files\Sunbelt Software\SBEAgent\"
set "FolderLocation[6]=C:\Program Files (x86)\VIPRE Business Agent\"
set "FolderLocation[7]=C:\Program Files (x86)\GFI Software\Deployment\"
set "FolderLocation[8]=C:\Program Files (x86)\GFI Software\GFIAgent\"
set "FolderLocation[9]=C:\Program Files (x86)\GFI Software\LanGuard 10\"
set "FolderLocation[10]=C:\Program Files (x86)\Sunbelt Software\Deployment\"
set "FolderLocation[11]=C:\Program Files (x86)\Sunbelt Software\SBEAgent\"
set "FolderLocation[12]=C:\ProgramData\VIPRE Business Agent\"
set "FolderLocation[13]=C:\ProgramData\GFI Software\Antimalware\"
set "FolderLocation[14]=C:\ProgramData\GFI Software\LanGuard 10\"
set "FolderLocation[15]=C:\ProgramData\Sunbelt Software\Antimalware\"
set "FolderLocation[16]=C:\Documents and Settings\All Users\Application Data\VIPRE Business Agent\"
set "FolderLocation[17]=C:\Documents and Settings\All Users\Application Data\GFI Software\Antimalware\"
set "FolderLocation[18]=C:\Documents and Settings\All Users\Application Data\GFI Software\LanGuard 10\"
set "FolderLocation[19]=C:\Documents and Settings\All Users\Application Data\Sunbelt Software\Antimalware\"
set "FolderLocation[20]=C:\Users\Default\VIPRE Business Agent\"
set "FolderLocation[21]=C:\Users\Default\GFI Software\Antimalware\"
set "FolderLocation[22]=C:\Users\Default\GFI Software\LanGuard 10\"
set "FolderLocation[23]=C:\Users\Default\Sunbelt Software\Antimalware\"

set "x=0"
:deleteFolderLoop
if defined FolderLocation[%x%] (
  if exist "!FolderLocation[%x%]!" rmdir /s /q "!FolderLocation[%x%]!" >> %LOGFILE% 2>&1
  set /a "x+=1"
  PING localhost -n 1 -w 100 >NUL REM - required to prevent race errors
  GOTO :deleteFolderLoop
)

set "FileLocation[0]=%SYSTEMROOT%\system32\drivers\sbaphd.sys"
set "FileLocation[1]=%SYSTEMROOT%\system32\drivers\sbapifs.sys"
set "FileLocation[2]=%SYSTEMROOT%\system32\drivers\SbFw.sys"
set "FileLocation[3]=%SYSTEMROOT%\system32\drivers\SbFwIm.sys"
set "FileLocation[4]=%SYSTEMROOT%\system32\drivers\sbhips.sys"
set "FileLocation[5]=%SYSTEMROOT%\system32\drivers\SBREDrv.sys"
set "FileLocation[6]=%SYSTEMROOT%\system32\drivers\sbtis.sys"
set "FileLocation[7]=%SYSTEMROOT%\system32\drivers\sbwtis.sys"
set "FileLocation[8]=%SYSTEMROOT%\system32\drivers\gfiark.sys"
set "FileLocation[9]=%SYSTEMROOT%\system32\drivers\gfiutil.sys"

set "x=0"
:deleteFileLoop
if defined FileLocation[%x%] (
  if exist "!FileLocation[%x%]!" del "!FileLocation[%x%]!"
  set /a "x+=1"
  GOTO :deleteFileLoop
)

echo Done.
echo.
echo ==========================================================
echo This script is now complete.  The final task is to reboot.
echo Please reboot ASAP. See the log file at %LOGFILE%
echo ==========================================================
REM set /p SHOULDIREBOOT="Would you like to reboot the computer now? [y/N]"
REM IF /I "%SHOULDIREBOOT%" NEQ "Y" GOTO END
REM shutdown -t 0 -r

:END
endlocal
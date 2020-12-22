@echo off
@setlocal

set MYDIR=%~dp0
pushd "%MYDIR%"

type NUL > install.log

rem Install NULL device driver
BthPS3Util.exe --install-driver --inf-path ".\BthPS3_PDO_NULL_Device.inf" --force >> install.log 2>&1

rem Enable profile service (L2CAP server)
BthPS3Util.exe --enable-service >> install.log 2>&1

rem Create "BthPS3PSM" driver service
BthPS3Util.exe --create-filter-service --bin-path ".\BthPS3PSM.sys" >> install.log 2>&1

rem Install filter driver in driver store
BthPS3Util.exe --install-driver --inf-path ".\BthPS3PSM.inf" --force >> install.log 2>&1

rem Create ROOT enumerated device
BthPS3Util.exe --create-device-node --hardware-id "Nefarius\BthPS3PSM" --class-name "System" --class-guid "4d36e97d-e325-11ce-bfc1-08002be10318" >> install.log 2>&1

rem Install filter driver on virtual hardware
BthPS3Util.exe --install-driver --inf-path ".\BthPS3PSM.inf" --force >> install.log 2>&1

rem Enable lower filter for BTHUSB
BthPS3Util.exe --enable-filter >> install.log 2>&1

rem Restart host device (causes BthPS3PSM to load)
BthPS3Util.exe --restart-host-device >> install.log 2>&1

rem Install profile/bus driver
BthPS3Util.exe --install-driver --inf-path ".\BthPS3.inf" --force >> install.log 2>&1

rem Instruct filter to enable patch
BthPS3Util.exe --enable-psm-patch --device-index 0 >> install.log 2>&1

popd
endlocal

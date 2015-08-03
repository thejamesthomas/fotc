$jde_download = 'http://downloads-us.blackberry.com/swdownloads/BlackBerry_JDE_4.7.0.exe?__dlmt__=1438579143_d15acf8095cdba8d1b64006a12a8a543&ext=.exe'
$jde_target = 'jde.exe'

Invoke-Expression ((New-Object Net.WebClient)).DownloadFile($jde_download,$jde_target)

#$installDir = 'C:\Program Files (x86)\JDE\'
$arguments = @(
	'/quiet'
	#,'TARGETDIR="' + $installDir + '"'
)

$proc = Start-Process $jde_target -ArgumentList $arguments -Wait -PassThru
if($proc.ExitCode -ne 0) {
	Throw "ERROR"
}

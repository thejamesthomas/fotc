$jdk_download = 'http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-windows-i586.exe'
$jdk_target = 'jdk.exe'

$client = new-object System.Net.WebClient
$cookie = "oraclelicense=accept-securebackup-cookie"
$client.Headers.Add([System.Net.HttpRequestHeader]::Cookie, $cookie)
$client.downloadFile($jdk_download, $jdk_target)

$installDir = 'C:\Program Files (x86)\Java\'
$arguments = @(
	'/s',
	'INSTALLDIR="' + $installDir + '"'
)

$proc = Start-Process $jdk_target -ArgumentList $arguments -Wait -PassThru
if($proc.ExitCode -ne 0) {
	Throw "ERROR"
}

[environment]::SetEnvironmentVariable('JAVA_HOME', $installDir, 'machine')

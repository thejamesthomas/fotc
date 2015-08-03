$shell = new-object -com shell.application

$download_source = 'https://eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-win32-x86_64.zip&r=1'
$download_target = 'eclipse.zip'
$extract_target = 'C:\Users\vagrant'

Invoke-Expression ((New-Object Net.WebClient)).DownloadFile($download_source,$download_target)

$zip_file = $shell.NameSpace($download_target)
foreach($file in $zip_file.items())
{
  $shell.Namespace($extract_target).copyhere($file)
}

$backup_folder = "C:\test_backup"
$current_directory = Get-Location
$choice = Read-Host "Are you sure you want to backup folder $($current_directory)? (y/n)"
while (($choice -ne "y") -and ($choice -ne "n")) {
    Write-Host "Invalid choice."
    $choice = Read-Host "Are you sure you want to backup folder $($current_directory)? (y/n)"
}
if ($choice -eq "y") {
    $folder_path = Join-Path -Path (Get-Location) -ChildPath "\*"
    $folder_name = Split-Path -Path (Get-Location) -Leaf
    $backup_path= Join-Path -Path $backup_folder -ChildPath "$($folder_name).zip"
    Compress-Archive -Path $folder_path -DestinationPAth $backup_path
}
else {
    Write-Host "Goodbye!"
}

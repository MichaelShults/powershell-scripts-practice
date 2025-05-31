param(
    [Parameter(Mandatory=$True)]
    $Path
)
$date = Get-Date -format "yyyy-MM-dd"

if ( $null -eq $env:FBMBackupLocation) {
    $backup_folder = Read-Host "Backup folder not defined, please choose path for backups"
    [Environment]::SetEnvironmentVariable("FBMBackupLocation", $backup_folder, "User")
    Write-Host "Please restart terminal for change to go into effect, then run the script again."
}
else {
    $backup_folder = $env:FBMBackupLocation
    $user_prompt = "Are you sure you want to backup folder $Path`? (y/n)"
    $choice = Read-Host $user_prompt
    while (($choice -ne "y") -and ($choice -ne "n")) {
        Write-Host "Invalid choice."
        $choice = Read-Host $user_prompt
    }
    if ($choice -eq "y") {
        $folder_path = Join-Path -Path $Path -ChildPath "\*"
        $folder_name = Split-Path -Path $Path -Leaf
        $backup_path= Join-Path -Path $backup_folder -ChildPath "$($folder_name +"_" + "$date").zip"
        Compress-Archive -Path $folder_path -DestinationPAth $backup_path
        Write-Host "Backup complete at $($backup_path)."
    }
    else {
        Write-Host "Goodbye!"
    }
}
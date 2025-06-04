param(
    [Parameter(Mandatory = $true)]
    [string]$Command,
    [string[]]$CommandArgs
)
Function Backup {
    param( 
        [Parameter(Mandatory = $true)]
        [string] $Path
    )
    If ($null -eq $env:FBMBackupLocation) {
        Write-Error "Backup folder not set, please use the 'UpdateBackupPath BackupPath'"
    }
    If (Test-Path $Path -PathType Container) {
        $choice = Read-Host "Confirm backup of $Path into $env:FBMBackupLocation (y/n) $"
        If ($choice -eq "y") {
            $date = Get-Date -format "yyyy-MM-dd"
            $folder_path = Join-Path -Path $Path -ChildPath "\*"
            $folder_name = Split-Path -Path $Path -Leaf
            $backup_file_name = "$($folder_name +"_" + "$date").zip"
            $backup_path= Join-Path -Path $env:FBMBackupLocation -ChildPath $backup_file_name
            Compress-Archive -Path $folder_path -DestinationPAth $backup_path
            Write-Host "Backup complete at $($backup_path)."
        } 
        Elseif ($choice -eq "n") {
            Write-Host "Program finished without backup action."
        }
        Else {
            Write-Error "Invalid choice."
        }
    } Else {
        Write-Error "Not a valid directory."
    }
}
Function UpdateBackupPath {
    param( 
        [Parameter(Mandatory = $true)]
        [string] $BackupPath
    )
    If (Test-Path $BackupPath -PathType Container) {
        [Environment]::SetEnvironmentVariable("FBMBackupLocation", $BackupPath, "User")
        Write-Host "Backup folder updated, please restart terminal for changes to apply."
    } Else {
        Write-Error "Not a valid directory."
    }
}
switch ($Command) {
    "UpdateBackupPath" {
        UpdateBackupPath @CommandArgs
    }
    "Backup" {
        Backup @CommandArgs
    }
}

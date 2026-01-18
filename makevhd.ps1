New-VHD -Path "rootfs.vhdx" -SizeBytes 64MB -Dynamic
Mount-VHD -Path "rootfs.vhdx"
$disk = Mount-VHD -Path "rootfs.vhdx" -Passthru | Get-Disk 
Initialize-Disk -Number $disk.Number -PartitionStyle MBR
$part = New-Partition -DiskNumber $disk.Number -UseMaximumSize -AssignDriveLetter
Format-Volume $part -FileSystem FAT32 -NewFileSystemLabel "rootfs"
Write-Host "RootFS image ready. Disk number: $disk.Number Drive: $part.DriveLetter"

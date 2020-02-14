workflow Rename-And-Reboot {
  param ([string]$Name)

  Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux

  Restart-Computer -Confirm -Wait

  Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing

  Add-AppPackage .\Ubuntu.appx

  Remove-Item .\Ubuntu.appx
}

Rename-And-Reboot
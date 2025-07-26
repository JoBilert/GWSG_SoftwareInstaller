# -------------------------------
# GWSG-SoftwareInstaller v 1.0
# (c) Jörg Bilert 2025
# -------------------------------

				# -------------------------------
				# 1. Check for winget availability
				# -------------------------------
				#Write-Host "Checking for winget availability..."
				#if (Test-Path "C:\Program Files\WindowsApps\Microsoft.Winget.Source_*.x64") {
				#    Write-Host "winget is available. Using winget for package management."
				#} else {
				#    Write-Host "winget is not available. Using manual download/install method."
					# Optional: Install winget if not available
					# Invoke-WebRequest -Uri 'https://github.com/microsoft/winget-cli/releases/latest/download/winget-cli-x64.exe' -OutFile 'winget-cli-x64.exe'
					# Start-Process .\winget-cli-x64.exe -ArgumentList "/S" -Wait
				#}

# -------------------------------
# 1. Setup Logfile
# -------------------------------
$logFilePath = "C:\Log\InstallationLog_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
$dir = Split-Path $logFilePath
if (-not (Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir | Out-Null
}

function Write-Log {
    param (
        [string]$Message,
        [string]$Level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[${Level}] [${timestamp}] ${Message}"
    Write-Output $logEntry
    Add-Content -Path $logFilePath -Value $logEntry -Encoding UTF8
}


Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show("Bitte alle folgenden Nachrichtenboxen positiv beantworten ('JA', 'Akzeptieren', 'Annehmen', 'OK',...","Installationshinweise",0,'Exclamation')

# -------------------------------
# 2. Install programs using winget
# -------------------------------
Write-Host "Installiere Programme mit winget..."
Write-Log "*** Installation mit winget ***" -Level INFO

# Adapt list for your own purposes
$programme_winget = @(
    #"MartiCliment.UniGetUI",
    #"GeoGebra.CalculatorSuite",
    #"Audacity.Audacity"
)

foreach ($p in $programme_winget){
    try {
		Write-Log "Installiere " $p -Level INFO
        winget install --id=$p --accept-package-agreements --accept-source-agreements --silent
        Write-Host "Installation mit winget abgeschlossen."
		Write-Log "Erfolgreich!" -Level INFO
    } catch {
        Write-Host "Fehler bei der Installation mit winget: $_"
		Write-Log "Fehler bei der Installation mit winget: $_" -Level ERROR
        exit 1
    }
}

# -------------------------------
# 3. Install programs manually (download + install)
# -------------------------------
Write-Host "Herkömmliche Installation ..."
Write-Log "*** Installation manuell ***" -Level INFO
# Adapt list to your own needs
$programme_manual = @(
    #"https://download.messenger.bycs.de/clients/bycs-messenger-latest-win.exe",
    #"https://desktop-client-download.drive.bycs.de/download/5.3.1.14278/bycsdrive-5.3.1.14278.x64.msi"
	#"https://phywe-itemservice.s3.eu-central-1.amazonaws.com/sites/DMS-Phywe/PROD/de-DE/item/phy_itemsoftware/14/14440-62/SETUPMD.msi"
)
foreach ($p in $programme_manual){
    try {
        $url = $p
        $installerPath = "C:\Temp\" + $(Split-Path -Path $Url -Leaf)
        Invoke-WebRequest -Uri $url -OutFile $installerPath
        Write-Host "Downloade von "  $url  " ..."
		Write-Log "Download: _$" -Level INFO
        if (Test-Path $installerPath) {
            Write-Host "Download abgeschlossen. Starte Installation..."
			Write-Log "Erfolgreich!" -Level INFO
			Write-Log "Starte Installation von " + $installerPath -Level INFO
            Start-Process -FilePath $installerPath -Wait
			Write-Log "$_ erfolgreich!" -Level INFO
        } else {
            Write-Host "Downloadfehler! Überprüfen Sie Ihre Internetverbindung."
			Write-Log "$_ - Downloadfehler!" -Level ERROR
        }

    } catch {
        Write-Host "Fehler bei der manuellen Installation $_"
		Write-Log "$_ - Installationsfehler!" -Level ERROR
        exit 1
    }
}

# -------------------------------
# 4. Office-Installation
# -------------------------------
[System.Windows.MessageBox]::Show("Sie werden nun auf die Seite www.officefuerbildung.de weitergeleitet. Bitte halten Sie ihren Office-Gutschein bereit und fahren Sie im Browserfenster mit der Installation fort.","MS-Office Installation",0,'Exclamation')
[System.Diagnostics.Process]::Start("msedge", "https://www.officefuerbildung.de")

# -------------------------------
# 5. Installation SparkVue
# -------------------------------
[System.Windows.MessageBox]::Show("Sie werden nun auf die Seite sparkvue.pasco.com weitergeleitet. Bitte klicken Sie auf das 'App verfügbar'-Icon oben rechts in der Adresszeile.","SPARKvue Installation",0,'Exclamation')
Start-Process "msedge" -ArgumentList "--new-tab https://sparkvue.pasco.com"

# -------------------------------
# 6. Optional: Handle cleanup or admin rights
# -------------------------------
[System.Windows.MessageBox]::Show("Speicherplatz wird wieder freigegeben - Installationsdateien werden gelöscht.","Aufräumen",0,'Exclamation')
Write-Host "Lösche alle Installationsdateien!"
Remove-Item c:\temp\* -Recurse
[System.Windows.MessageBox]::Show("Installation abgeschlossen.","Ende",0,'Exclamation')
Write-Host "Installation abgeschlossen."

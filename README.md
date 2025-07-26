# GWSG_SoftwareInstaller
Powershell-Script zum Herunterladen und Installieren von Software für die Laptops am GWSG Bad Windsheim

## 1. Wo bekomme ich das Skript her?
Laden Sie das Skript von der Homepage des GWSG herunter oder wählen sie Rechts unter Releases das pssende Paket und entpacken Sie es auf dem Laptop.

## 2. Was macht das Skript?
Das Skript lädt die Software, die für den Unterricht am GWSG benötigt wird, wenn möglich vollautomatisch in der aktuellen VErsion herunter und installiert diese so automatisch wie möglich. 
Dort wo eine vollkommen automatische Installation nicht möglich ist, sollten Sie möglichst die voreingestellten Angaben übernehmen.

### Sonderfall: measureDynamics, MS-Office, SPARKvew
#### measureDynamics: 
Die Software wird vom Skript automatisch heruntergeladen und die Installation gestartet.
Im Lauf der Installation wird eine Seriennummer benötigt. Die Seriennummer erhalten Sie in einem separaten Schreiben der Schule.
#### MS-Office:
Die Schülerinnen und Schüler konnen eine MS-Office Jahreslizenz im Sekretariat in Form eines Gutscheins erhalten.
Das Installationsskript öffnet automatisch die Seite https://www.officefuerbildung.de. Dort muss der Key auf dem Gutschein angegeben werden. Folgen Sie anschließend den Anweisungen auf dem Bildschirm ume ien Account neu einzurichten oder zu verlängern und MS-Office auf dem Gerät zu installieren. Auf der Seite steht auf eine ausführliche Hilfefunktion zur Verfügung.
#### SPARKview
Das Installationsskript öffnet automatisch die Seite https://sparkvue.pasco.com 
In der Adresszeile des Edge-Browsers klicken Sie auf dieses Icon <img width="27" height="25" alt="Screenshot 2025-07-26 151750" src="https://github.com/user-attachments/assets/3d3f2cc3-7cfa-4020-a5ee-e544b4ffb97c" />.
Wählen Sie "installieren", um die Software zu installieren. Setzen Sie das Häkchen bei "Desktopverknüpfung erstellen" und bestätigen Sie die Installation mit "Zulassen".

Selbstverständlich kann die Software auch manuell ohne das Skript installiert werden. 

## 3. Wie starte ich das Skript?
* Öffnen Sie den Ordner, in dem Sie das Skript gespeichert haben (standardmäßig im "Downloads"-Ordner).
* Klicken Sie die Datei *GWSG-Softwareinstaller.ps1* mit der **rechten Maustaste** bzw. der **rechten Taste des Touchpads** an und wählen Sie die Option *"Mit PowerShell ausführen"*.
  
## Fragen? Anregungen?
Bei Problemen, Fragen und Anregungen können Sie gerne die "Issues"-Seite des Github-Repositories https://github.com/JoBilert/GWSG_SoftwareInstaller/issues nutzen oder eine E-Mail an systembetreuung(at)gwsg.net schreiben.

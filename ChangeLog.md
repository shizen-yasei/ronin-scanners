### 0.1.4 / 2009-07-02

* Use Hoe >= 2.0.0.
* Require rprogram >= 0.1.6.
* Require ronin >= 0.2.4.

### 0.1.3 / 2009-02-23

* Added a git style sub-command (`ronin-scanners`) which starts
  the Ronin console with `ronin/scanners` pre-loaded.
* Require Ronin >= 0.2.1.

### 0.1.2 / 2009-02-08

* Added a Rubyful interface to the Nikto web scanner:
  * Ronin::Scanners::Nikto.
  * Ronin::Scanners::NiktoTask.

### 0.1.1 / 2009-01-09

* Require ScanDB >= 0.1.3 for the latest bug fixes.
* Added comma-separators to various Ronin::Scanners::NmapTask options.
* Require 'ronin/scanners/nmap' in 'ronin/scanners'.

### 0.1.0 / 2009-01-08

* Initial release.
  * Provides a Rubyful interface to Nmap.
  * Allows for the recording of Nmap scan results using ScanDB.


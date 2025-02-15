# Zoom (19 May)

|  CP Information  |             |
|-----------------|-------------|
| Package | [Zoom - Current Version](https://support.zoom.us/hc/en-us/articles/205759689-New-Updates-for-Linux) |
| Script Name | [zoom-cp-init-script.sh](build/zoom-cp-init-script.sh) |
| CP Mount Path | /custom/zoom |
| CP Size | 600M |
| IGEL OS Version (min) | 11.4.240 |
| Path to Executable | /custom/zoom/usr/bin/zoom |
| Path to Icon | /custom/zoom/usr/share/pixmaps/Zoom.png |
| Packaging Notes | See build script for details |
| Package automation | [build-zoom-cp.sh](build/build-zoom-cp.sh) |

|  Customization | /wfs/user/.zoom/.zoomus.conf |
|----------------|------------------------------|
| German Language | language=de |
| French Language | language=fr |

[Supported Zoom Languages](https://support.zoom.us/hc/en-us/articles/209982306-Change-your-language-on-Zoom)

[ISO 639-1 Language Codes](https://www.loc.gov/standards/iso639-2/php/code_list.php)

Sample for setting German language (reboot required after CP deployed)
![zoomus.conf language German](build/zoom-zoomus.conf-lang-german.png)

--------

## Zoom Requirements

[Zoom Virtual Background system requirements](https://support.zoom.us/hc/en-us/articles/360043484511)

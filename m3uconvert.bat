@echo off
setlocal enabledelayedexpansion
FOR %%A IN (%*) DO (
	set inname=%%A
	echo !inname!
	set auxstr=M7
	set outname="!inname:~0,-6!!auxstr!.m3u"
	pwsh -Command "(gc \"!inname!\" -encoding UTF8) -Replace '.*iTunesMedia\\Music\\', '/storage/external_sd/' -Replace '\\', '/' | Out-File -encoding Utf8NoBom !outname!"
)
pause

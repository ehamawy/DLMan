@mode 80,25
@ECHO OFF
@title DLMan
cd lib
::@chcp 65001
:Start
::DEVICE=ANSI.SYS
cls
type "1.ans"
set /P url=URL: 
cls
type "2.ans"

CHOICE /C 123 /M "Choose:"

IF ERRORLEVEL 3 GOTO Thumbnail
IF ERRORLEVEL 2 GOTO Music
IF ERRORLEVEL 1 GOTO Video


:Music
cls
type "3.ans"
yt-dlp --extract-audio --audio-format mp3 --concurrent-fragments 4 --console-title -P ".." %url%
GOTO Done

:Video
cls
type "3.ans"
yt-dlp -f mp4 --remux-video mp4 --concurrent-fragments 4 --console-title -P ".." %url%
GOTO Done

:Thumbnail
cls
type "3.ans"
yt-dlp --write-thumbnail --skip-download -P ".." %url%
GOTO Done

:Done

cls
type "4.ans"

CHOICE /C 12 /M ""

IF ERRORLEVEL 2 GOTO End
IF ERRORLEVEL 1 GOTO Start

:End
@mode 80,25
@ECHO OFF
@title DLMan
cd lib
::@chcp 65001
:Start
::DEVICE=ANSI.SYS
cls
ECHO This is for downloading massive amounts of videos at once
ECHO Make a file called batch.txt and put video urls in it
ECHO Each url should be on a different line
ECHO Lines starting with # ; or ] are comments
ECHO.
pause
cls
type "2.ans"

CHOICE /C 123 /M "Choose:"

IF ERRORLEVEL 3 GOTO Thumbnail
IF ERRORLEVEL 2 GOTO Music
IF ERRORLEVEL 1 GOTO Video


:Music
cls
type "3.ans"
yt-dlp --extract-audio --audio-format mp3 --concurrent-fragments 4 --console-title -P "..\batch" --batch-file ..\batch.txt %url%
pause
GOTO Done

:Video
cls
type "3.ans"
yt-dlp -f mp4 --remux-video mp4 --concurrent-fragments 4 --console-title -P "..\batch" --batch-file ..\batch.txt %url%
GOTO Done

:Thumbnail
cls
type "3.ans"
yt-dlp --write-thumbnail --skip-download -P "..\batch" --batch-file ..\batch.txt %url%
GOTO Done

:Done

cls

:End
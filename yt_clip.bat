@echo off
setlocal

:: Check for yt-dlp
where yt-dlp >nul 2>&1
if errorlevel 1 (
    echo [ERROR] yt-dlp is not installed or not in PATH.
    echo Download it from: https://github.com/yt-dlp/yt-dlp/releases
    pause
    exit /b
)

:: Check for ffmpeg
where ffmpeg >nul 2>&1
if errorlevel 1 (
    echo [ERROR] ffmpeg is not installed or not in PATH.
    echo Download it from: https://ffmpeg.org/download.html
    pause
    exit /b
)

:: Ask for YouTube video ID
set /p video_id=Enter YouTube Video ID (e.g. dQw4w9WgXcQ): 

:: Ask for timestamp range
set /p timestamp=Enter timestamp range (e.g. 00:30-00:35): 

:: Ask for output name (without extension)
set /p output=Enter output file name (without extension): 

:: Run yt-dlp with the provided values
yt-dlp "https://www.youtube.com/watch?v=%video_id%" ^
  --download-sections "*%timestamp%" ^
  --force-keyframes ^
  -o "yt-clip-output/%output%.%%(ext)s"

echo.
echo ✅ Done! Saved as: %output%.*
pause
rem Remember to pass -C Debug or similar if you're using Visual Studio!

ctest -D ExperimentalTest --no-compress-output %*
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%~dp0\save-test.ps1'"

ctest -D ExperimentalTest --no-compress-output

:: head is a cygwin utility
FOR /f %%I IN ('head -n 1 Testing/TAG') DO SET DIR=%%I
COPY Testing\%DIR%\Test.xml CTestResults.xml
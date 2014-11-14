# Run with current working dir set to the build dir.
# For best results, use the batch file to run the tests then run this.
Param(
  [string]$C = $null
)
$outfile = "CTestResults.xml"
if ($C -ne $null) {
    $outfile = "$C.$outfile"
    ctest -D ExperimentalTest -V --no-compress-output -C $C
} else {
    ctest -D ExperimentalTest -V --no-compress-output
}
Copy-Item Testing\$(Get-Content Testing\TAG -TotalCount 1)\Test.xml $outfile
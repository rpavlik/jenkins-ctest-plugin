# jenkins-ctest-plugin + [xUnit-plugin](http://wiki.jenkins-ci.org/display/JENKINS/xUnit+Plugin "xUnit Plugin") = CTest test reports in [Jenkins-CI](http://jenkins-ci.org/ "Extensible continuous integration server")

## Installation

1. Make sure you've installed the xUnit Plugin in Jenkins.
2. Get the [`ctest-to-junit.xsl`][xsl] file onto your Jenkins server(s) - I tend to use a Git Submodule to pull this whole repo into other projects.


## Using the Transform

1. When configuring your Job, enable the xUnit Plugin and select the *Custom Tool* option.
2. Specify a pattern for CTest files to transform.
3. Specify the path to the [`ctest-to-junit.xsl`][xsl] stylesheet
4. GO!

## Running the Tests
It takes a little finagling to get CTest to generate the XML output for consumption by this XSL.

### *nix
You might want to look at [`run-test-and-save.sh`][sh] to see one way of prompting CTest to generate XML output and then moving it. You can execute that script as a build step from your build directory, and then your "pattern" will be `BUILDDIR/CTestResults.xml`.

### Windows
If you're on Windows, you can use the PowerShell script (with batch file launcher): run [`run-test-and-save.bat`][bat] (which runs [`run-test-and-save.ps1`][ps1] for you) which will have the same results as the *nix shell script. Note that if you're using a multi-config generator (for example, Visual Studio), you need to pass a configuration to this script (which will pass it on to CTest), something like `-C Debug`.

[xsl]: ctest-to-junit.xsl
[sh]: run-test-and-save.sh
[bat]: run-test-and-save.bat
[ps1]: run-test-and-save.ps1

## License

`jenkins-ctest-plugin` is covered under the MIT License. See [LICENSE](LICENSE) for more information.

Based on [WebUI-plugin](https://github.com/versionone/webui-plugin "WebUI Plugin")


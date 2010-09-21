# WebUI-plugin + [xUnit-plugin](http://wiki.hudson-ci.org/display/HUDSON/xUnit+Plugin "xUnit Plugin") = test reports for [Hudson-CI](http://hudson-ci.org/ "Extensible continuous integration server")

## Installation

1. Make sure you've installed the xUnit Plugin
2. Get the `webui-to-junit.xsl` file onto your Hudson server(s) - I tend to use a Git Submodule to pull this repo into other projects

## Usage

1. When configuring your Job, enable the xUnit Plugin and select the *Custom Tool* option
2. Specify a pattern for WebUI files to transform
3. Specify the path to the `webui-to-junit.xsl` stylesheet
4. GO!

## License

WebUI-plugin is covered under the MIT License. See LICENSE for more information.


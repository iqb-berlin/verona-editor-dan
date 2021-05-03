# verona-editor-dan

Editor component for the IQB Visual Unit Player(https://github.com/iqb-berlin/verona-player-dan)


## Build

If on Windows you may use the batch script `custom_build.bat`. It can be used via npm with `npm run build`.
For Linux there is a bash script, which you have to execure directly, `./build.sh`.

In order to use the player as single-file-package (i. e. for IQB Teststudio), you must run the IQB dist-package. In package.json, you find the call for linux as `pack`, for windows as `pack-windows` (different handling of package.json variables to set the correct package file name). 

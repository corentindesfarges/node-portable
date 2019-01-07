@echo off

set version="%1"
if "%1" == "" set version=10.14.1

if not exist "%cd%\node-v%version%.zip" (
  pushd %~dp0
  cscript ./download.vbs "https://nodejs.org/dist/v%version%/node-v%version%-win-x64.zip" "%cd%\node-v%version%.zip"
)

if not exist "%cd%\node-v%version%-win-x64" (
  pushd %~dp0
  cscript ./unzip.vbs "%cd%\node-v%version%.zip" "%cd%"
)

if not exist "%cd%\npm-global" (
  mkdir "%cd%\npm-global"
)

if not exist "%cd%\npm-cache" (
  mkdir "%cd%\npm-cache"
)

set PATH=%PATH%;%cd%\node-v%version%-win-x64\;%cd%\npm-global\

call %cd%\node-v%version%-win-x64\npm config set prefix %cd%\npm-global --global
call %cd%\node-v%version%-win-x64\npm config set cache %cd%\npm-cache --global

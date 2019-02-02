@echo off

:: Install neovim configuration.
::
mkdir %LOCALAPPDATA%\nvim 
mklink /J %LOCALAPPDATA%\nvim\init.vim nvim\init.vim
mklink /J %LOCALAPPDATA%\nvim\ginit.vim nvim\ginit.vim

:: Install git configuration.
::
:: mklink /J %USERPROFILE%\.gitconfig dot.gitconfig

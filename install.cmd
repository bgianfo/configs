@echo off

:: Install neovim configuration.
::
mkdir %LOCALAPPDATA%\nvim 
mklink /H %LOCALAPPDATA%\nvim nvim

mklink /H %USERPROFILE%\_vimrc nvim\init.vim
mklink /J %USERPROFILE%\vimfiles nvim

:: Install git configuration.
::
:: mklink /J %USERPROFILE%\.gitconfig dot.gitconfig

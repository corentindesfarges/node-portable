for /d %%G in (".\node-v*") do rd /s /q "%%~G"
rmdir .\npm-cache
rmdir .\npm-global
del .\node-*

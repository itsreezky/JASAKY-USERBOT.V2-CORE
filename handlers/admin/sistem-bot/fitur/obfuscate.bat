@echo off

REM Folder pengaturan-sebar
for %%f in ("updateBot.js") do (
    javascript-obfuscator "%%f" ^
                --output "%%f.obf.js" ^
                --compact true ^
                --string-array true ^
                --string-array-threshold 0.4 ^
                --string-array-encoding base64 ^
                --self-defending true ^
                --identifier-names-generator mangled ^
                --rename-globals false
)

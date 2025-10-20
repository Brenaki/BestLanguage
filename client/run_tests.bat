@echo off
REM Script para executar os testes k6 3 vezes
REM Salva os resultados com o padrão: out(${numero da repeticao})_${linguagem}.txt

set language=go
set port=3010

echo Iniciando execucao dos testes k6...
echo Linguagem: %language%
echo Porta: %port%

for /L %%i in (1,1,3) do (
    set outputFile=out(%%i)_%language%.txt
    
    echo.
    echo Executando teste %%i de 3...
    echo Arquivo de saida: out(%%i)_%language%.txt
    
    k6 run .\script.js > out(%%i)_%language%.txt
    
    if %errorlevel% equ 0 (
        echo Teste %%i concluido com sucesso!
    ) else (
        echo Erro na execucao do teste %%i
    )
    
    timeout /t 2 /nobreak >nul
)

echo.
echo Todos os testes foram executados!
echo Arquivos gerados:
dir out(*)_%language%.txt

pause

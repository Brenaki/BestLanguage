#!/bin/bash

# Script para executar os testes k6 3 vezes
# Salva os resultados com o padrão: out(${numero da repeticao})_${linguagem}.txt

language="python"  # Linguagem sendo testada

echo -e "\033[32mIniciando execução dos testes k6...\033[0m"
echo -e "\033[33mLinguagem: $language\033[0m"

for i in {1..3}; do
    outputFile="out($i)_$language.txt"
    
    echo -e "\n\033[36mExecutando teste $i de 3...\033[0m"
    echo -e "\033[37mArquivo de saída: $outputFile\033[0m"
    
    # Executa o k6 e salva a saída no arquivo
    k6 run ./script.js > "$outputFile"
    
    if [ $? -eq 0 ]; then
        echo -e "\033[32mTeste $i concluído com sucesso!\033[0m"
    else
        echo -e "\033[31mErro na execução do teste $i\033[0m"
    fi
    
    # Pequena pausa entre os testes
    sleep 5
    # Limpa o console
    clear
done

echo -e "\n\033[32mTodos os testes foram executados!\033[0m"
echo -e "\033[33mArquivos gerados:\033[0m"
ls -1 out\(*\)_$language.txt 2>/dev/null | while read -r file; do
    echo -e "  \033[37m- $file\033[0m"
done

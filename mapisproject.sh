#!/bin/bash

# Nome do arquivo de saída
OUTPUT="project_map.txt"

echo "====================================================" > $OUTPUT
echo "MAPA DO PROJETO: ClickirTool" >> $OUTPUT
echo "Gerado em: $(date)" >> $OUTPUT
echo "====================================================" >> $OUTPUT
echo "" >> $OUTPUT

# Comando para mapear pastas e arquivos
# -not -path '*/.*'  -> Ignora pastas ocultas (como .git)
# -not -path './build*' -> Ignora a pasta build (que é gigante)
# -not -path './app/build*' -> Ignora a pasta build do app
# -not -path './.gradle*' -> Ignora cache do gradle

find . -maxdepth 10 \
    -not -path '*/.*' \
    -not -path './build*' \
    -not -path './app/build*' \
    -not -path './.gradle*' \
    -not -path './gradle*' \
    | sed -e "s/[^-][^\/]*\// |/g" -e "s/| [^- ]/|-- /" >> $OUTPUT

echo "Mapa gerado com sucesso em: $OUTPUT"
echo "Para visualizar, digite: cat $OUTPUT"

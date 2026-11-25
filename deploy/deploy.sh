#!/bin/bash
set -e
echo "=== INICIANDO DEPLOY SIMULADO ==="
mkdir -p build
echo "Copiando arquivos de código para a pasta build..."
cp -r src build/ 2>/dev/null || echo "Nenhum arquivo na pasta src para copiar"
echo "Criando artefato de deploy (app.zip)..."
zip -r app.zip build/
echo "=== DEPLOY CONCLUÍDO COM SUCESSO ==="

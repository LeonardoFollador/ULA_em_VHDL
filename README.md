# ULA em VHDL para FPGA

Este projeto consiste no desenvolvimento de uma Unidade Lógica Aritmética (ULA) implementada em VHDL para uma FPGA, utilizando o software Quartus II. A ULA realiza operações básicas de aritmética e lógica, como soma, subtração e comparações.

## Funcionalidades

A ULA implementada suporta as seguintes operações:

1. **Soma** - Operação de adição entre dois números.
2. **Subtração** - Operação de subtração entre dois números.
3. **Comparação**:
   - **Maior que** - Verifica se um número é maior que o outro.
   - **Menor que** - Verifica se um número é menor que o outro.
   - **Igualdade** - Verifica se dois números são iguais.

Cada operação é identificada por um código específico no sinal `OP`:
- **Soma**: `0001`
- **Subtração**: `0010`
- **Maior que**: `0100`
- **Menor que**: `1000`
- **Igualdade**: `1001`

## Pré-requisitos

- **Quartus II** - Software de desenvolvimento utilizado para síntese e implementação do código em uma FPGA.

## Configuração e Simulação

Para simular o funcionamento da ULA:

1. Abra o projeto no Quartus II.
2. Compile o projeto para verificar possíveis erros de síntese.
3. Utilize o simulador integrado do Quartus II para testar cada uma das operações da ULA.
4. Configure os sinais de entrada para as operações desejadas e observe os resultados nas saídas.

## Entradas e Saídas

### Entradas
- **A**: Primeiro operando.
- **B**: Segundo operando.
- **OP**: Código da operação a ser realizada (soma, subtração, comparação).

### Saídas
- **Resultado**: Saída que apresenta o resultado da operação aritmética ou lógica.
- **Flags**:
  - **Igual**: Indica se A é igual a B.
  - **Maior**: Indica se A é maior que B.
  - **Menor**: Indica se A é menor que B.

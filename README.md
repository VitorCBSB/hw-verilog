#hw-verilog

##Proposta: modificar o bitstream carregado na FPGA diretamente.

O bitstream permite acesso às mais minuciosas configurações da FPGA. Com isso, é possível realizar uma evolução intrínseca da mesma forma feita no livro do Thompson.

###Problemas encontrados

Além da pouca documentação acerca do formato do bitstream da Altera, e de ter que aprender a modificá-lo sem que a FPGA fique danificada, ele é cifrado por AES-256. O que significa que, a menos que eu consiga quebrar o AES, essa não é uma opção válida.

##Proposta: gerar arquivos Verilog dinamicamente.

A segunda tentativa veio com o intuito de não mexer diretamente no bitstream, pelas dificuldades anteriores. Perde-se um nível menor de evolução possível, mas não há risco de danificação nem cifras para serem quebradas. O processo envolveu a criação de um programa C++ que em seu algoritmo genético, na avaliação dos indivíduos, gerava seus arquivos Verilog e os carregava na FPGA.

###Problemas encontrados

O principal problema encontrado foi o tempo que cada geração exigia (cerca de 7 minutos para 5 indivíduos). Visto que nas simulações por Icarus Verilog, um problema como um somador de 1 bit com carry-in/out levava cerca de 3000 gerações, era inviável deixar o programa rodando por meses.

##Proposta: simular pelo Icarus somente.

Visto que, na etapa anterior, o maior problema é o fato do algoritmo exigir muito tempo, a simulação é um processo significativamente mais rápido. Aqui, perde-se a evolução intrínseca a favor de desempenho.

###Problemas encontrados

Icarus Verilog não consegue simular feedbacks combinacionais, além do fato de se perder a evolução intrínseca.

##Proposta: utilizar o processador MIPS de OAC.

Utilizando um programa feito puramente em C, sem auxílio de bibliotecas externas, compilado para MIPS, ele fica responsável por rodar o algoritmo genético. O circuito genético passa a ter, além de suas entradas e saídas normais, uma entrada que indica sua configuração.

###Problemas encontrados

O processador MIPS foi feito para ser utilizado pela placa DE2-70 e não pela DE2-115. A memória SRAM usada na 70 é diferente da 115. O projeto teria que ser consideravelmente modificado.

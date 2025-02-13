# Mini Talk

## Descrição
O projeto Mini Talk é uma aplicação de comunicação entre processos utilizando sinais do sistema operacional. Ele consiste em dois programas principais: o cliente e o servidor.

## Arquivos

### minitalk.h
Este arquivo contém as definições e declarações necessárias para a comunicação entre o cliente e o servidor.

### Makefile
O Makefile é utilizado para compilar o projeto. Ele contém as regras para compilar os arquivos `client.c` e `server.c`.

### client.c
Este arquivo contém a implementação do cliente, que envia mensagens para o servidor utilizando sinais.

### server.c
Este arquivo contém a implementação do servidor, que recebe mensagens do cliente e as exibe.

## Como Compilar
Para compilar o projeto, execute o comando:
```sh
make
```

## Como Executar
Primeiro, inicie o servidor:
```sh
./server
```

Em seguida, em outro terminal, execute o cliente passando a mensagem que deseja enviar:
```sh
./client <PID do servidor> "Sua mensagem"
```

## Autor
Este projeto foi desenvolvido por eschula42.

# FÁBRICA SYMFONY DOCKER COM UBUNTU + APACHE + PHP
## UBUNTU - IMAGEM OFICIAL 
    - Ubuntu 20.04
    - Php 8.1
    - Apache 2.4
    - Symfony 6.0.8 | Symfony cli 5.4.8

### PASSO 1
    - executar o comando:
    ```bash
    docker-compose up
    ```bash
 
### PASSO 2 
* Para executar uma instrucao symfony na maquina host, após executar o "docker-compose up" voce poderar usar, como exemplo para iniciar um skeleton de um projeto web completo dentro do diretorio atual:
    ````bash
    docker exec -it symfony symfony new --dir:. --webapp
    ````
* Em criar o projeto em um novo diretorio;
    ````bash
    docker exec -it symfony symfony new DIRETORIO_PROJETO --webapp
    ````
* Podera trabalhar dentro da "Fabrica" que no caso é rodando o comando dentro do bash do container a exemplo:
    ```bash
    docker exec -it symfony bash
    ```

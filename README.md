# FABRICA SYMFONY COM UBUNTU + APACHE + PHP
## UBUNTU - IMAGEM OFICIAL 
    - ubuntu 20.04
    - php 8.1
    - apache 2.4
    - symfony cli
### PASSO 1
    - executar o comando:
    ```bash
    docker-compose up
    ```bash
 
### PASSO 2 
* Para executar uma instrucao symfony na maquina host, após executar o "docker-compose up" voce poderar usar, como exemplo para iniciar um skeleton de um projeto web completo:
    ````bash
    docker exec -it symfony symfony new app_nome --webapp
    ````
* Podera trabalhar dentro da "Fabrica" que no caso é rodando o comando dentro do bash do container a exemplo:
    ```bash
    docker exec -it symfony bash
    ```

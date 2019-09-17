# Lab Embarcados

## Setup

1. [Instalar o docker](https://docs.docker.com/install/)
1. Clonar o repositório com:

    ```bash
    git clone --recursive https://github.com/rmohashi/lab-embarcados.git
    ```

1. Rodar `docker_build.sh` para fazer o build da imagem
    * Caso não funcione, rodar na raíz do projeto:

        ```bash
        docker build -t rmohashi/lab-embarcados docker
        ```

## Execução

1. Executar o script `run.sh`
    * É possível passar um parâmetro com a pasta com os arquivos colocados na imagem

        ```bash
        ./run.sh pasta/com/os/arquivos
        ```
1. Buildar o QEMU dentro do console aberto:

    ```bash
    build_qemu
    ```

    * Caso não precise configurar a build, rodar:

        ```bash
        build_qemu --skip_configure
        ```

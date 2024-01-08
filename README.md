# mojo-example
Try [Mojo](https://docs.modular.com/mojo/) with Docker.

# Try
1. `git clone https://github.com/yyotti/mojo-example.git`.
1. `docker compose build`
1. `docker compose run app`
1. In docker container:
    ```txt
    root@...:/app# mojo hello.mojo
    Hello, world!!
    日本語どうかな
    ```

# Try build
1. `docker compose run app`
1. In docker container:
    ```txt
    root@...:/app# ls -l
    total 4
    -rw-r--r-- 1 1000 1000 114 Jan  8 07:39 hello.mojo
    root@...:/app# ls -l
    total 1044
    -rwxr-xr-x 1 root root 1062176 Jan  8 08:16 hello
    -rw-r--r-- 1 1000 1000     114 Jan  8 07:39 hello.mojo
    root@...:/app# ./hello
    Hello, world!!
    日本語どうかな
    ```

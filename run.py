import fcntl
import termios
import time
import subprocess
import os

def inject_tty(tty_path, text):
    """Injeta texto diretamente no buffer de entrada de um TTY."""
    with open(tty_path, 'w') as fd:
        for char in text:
            # TIOCSTI insere um caractere na fila de entrada do terminal
            fcntl.ioctl(fd, termios.TIOCSTI, char)

def executar_processo():
    # 1. Troca para o TTY3
    print("Mudando para TTY3...")
    subprocess.run(['sudo', 'chvt', '3'])
    time.sleep(1)

    target_tty = '/dev/tty3'

    # 2. Injeta Usuário
    print("Injetando login...")
    inject_tty(target_tty, 'user\n')
    time.sleep(0.75)

    # 3. Injeta Senha
    print("Injetando senha...")
    inject_tty(target_tty, 'password\n')
    time.sleep(1)

    # 4. Executa o Script
    print("Executando comando final...")
    inject_tty(target_tty, './virusPrank/virus.sh\n')

if __name__ == "__main__":
    if os.getuid() != 0:
        print("Erro: Execute com 'sudo python3 script.py'")
    else:
        executar_processo()

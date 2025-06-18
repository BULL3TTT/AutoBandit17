# Script para Resolver Bandit Nivel 16

## Descripción

Este script en Bash automatiza la resolución del nivel 16 del wargame Bandit de OverTheWire. El objetivo es obtener la contraseña para el siguiente nivel (Bandit17) enviando la contraseña actual a un puerto en el rango de 31000 a 32000 en el localhost, utilizando una conexión SSL/TLS.

## Requisitos

- **Herramientas necesarias:**
  - `sshpass`: para automatizar la entrada de contraseñas en SSH.
  - `ncat`: para establecer conexiones de red.
  - `openssl`: para establecer conexiones SSL/TLS.

## Funcionamiento del Script

1. **Conexión SSH a Bandit16:**
   - El script inicia una conexión SSH al servidor Bandit16 utilizando la contraseña obtenida en el nivel 15.

2. **Escaneo de puertos:**
   - Una vez conectado, el script crea un directorio temporal y escanea los puertos en el rango de 31000 a 32000 en el localhost.
   - Para cada puerto abierto, intenta establecer una conexión SSL/TLS utilizando `ncat` y envía la contraseña actual.

3. **Obtención de la clave privada:**
   - Si la conexión es exitosa, el servidor devuelve una clave privada RSA.
   - El script guarda esta clave en un archivo llamado `id_rsaC` y ajusta sus permisos para que sea legible solo por el propietario.

4. **Conexión a Bandit17:**
   - Utilizando la clave privada obtenida, el script se conecta al siguiente nivel (Bandit17) a través de SSH y muestra la contraseña para el siguiente nivel.

## Uso

1. **Ejecutar el script:**
   - Asegúrate de tener instaladas las herramientas necesarias (`sshpass`, `ncat`, `openssl`).
   - Ejecuta el script en tu terminal:

     ```bash
     ./AutoBandit16.sh
     ```

2. **Obtener la contraseña de Bandit17:**
   - Una vez ejecutado el script, la contraseña para Bandit17 se mostrará en la salida de la terminal.

## Notas

- **Limitaciones:**
  - El script está diseñado específicamente para Bandit16. No es aplicable a otros niveles del wargame sin modificaciones.

## Contribuciones

Si deseas mejorar este script o adaptarlo para otros niveles del wargame Bandit, siéntete libre de realizar un fork de este repositorio y enviar tus contribuciones.

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV WINEDEBUG=-all

# Habilitar soporte de 32 bits e instalar Wine completo con pantalla virtual (Xvfb)
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine wine32 wine64 xvfb && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

EXPOSE 12345

# Ejecutar Wine dentro del servidor gráfico virtual
CMD ["xvfb-run", "--auto-servernum", "wine", "server.exe"]
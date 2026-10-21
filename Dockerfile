FROM ubuntu:22.04

# Desactivar avisos interactivos de instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar Wine (capa de compatibilidad para ejecutar .exe en Linux)
RUN apt-get update && apt-get install -y wine && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar el ejecutable y todas sus librerías (.dll) al contenedor
COPY . .

# Exponer el puerto de red
EXPOSE 12345

# Iniciar el ejecutable mediante Wine
CMD ["wine", "server.exe"]
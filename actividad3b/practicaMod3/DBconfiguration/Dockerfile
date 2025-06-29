# Usa la imagen oficial de PostgreSQL
FROM postgres:latest

# Copia archivos de inicialización si los tienes
COPY init.sql /docker-entrypoint-initdb.d/
COPY save_data.sql /docker-entrypoint-initdb.d/

# No es necesario agregar más instrucciones si solo quieres una base de datos PostgreSQL estándar.
# PostgreSQL ejecutará automáticamente los scripts en /docker-entrypoint-initdb.d/ al iniciar el contenedor por primera vez.
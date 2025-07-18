# Distributed_Cassandra_BD1
## Diseño de Base de Datos Distribuida para Sistema de Pedidos

Este proyecto implementa un sistema de pedidos distribuido usando Apache Cassandra, orientado a la gestión eficiente y escalable de pedidos para una plataforma tipo FastEat.

### Objetivos del Proyecto
1. Analizar los requerimientos funcionales del sistema de pedidos y entregas, identificando los tipos de datos principales, relaciones y operaciones críticas de consulta y escritura.
2. Diseñar un modelo de datos eficiente para Cassandra, aplicando las mejores prácticas de bases de datos NoSQL, optimizando consultas y garantizando la integridad de la información.
3. Definir la estructura de tablas, claves de partición y clustering keys más adecuadas para responder a los retos de la plataforma (consultas por usuario, seguimiento de pedidos, historial de entregas, etc.).
4. Proponer una estrategia de despliegue en contenedores Docker para la infraestructura de Cassandra, asegurando escalabilidad horizontal y alta disponibilidad.
5. Justificar las decisiones de diseño en función de los escenarios de uso y los retos operativos descritos.
6. Leer datos desde un archivo externo tipo JSON en Python/Jupyter para insertarlos en la base de datos.
7. Desarrollar y ejecutar consultas esenciales sobre la base de datos implementada utilizando Python en Jupyter Notebook para la conexión y análisis de los datos. Las consultas demuestran recuperación de pedidos, inserción de nuevos pedidos, actualización del estado de entregas y generación de reportes simples.

### Pasos para Ejecutar el Proyecto
1. Clonar el repositorio
    ```zsh
    git clone https://github.com/gamurigm/Distributed_Cassandra_BD1.git
    cd Distributed_Cassandra_BD1
    ```
2. Crear y activar entorno virtual
    ```zsh
    python3 -m venv venv
    source venv/bin/activate
    ```
3. Instalar dependencias
    ```zsh
    pip install cassandra-driver ipykernel
    ```
4. Desplegar Cassandra con Docker
    ```zsh
    docker network create cassandra-net
    # Nodo 1
    docker run -d --name cassandra-1 --memory=1.5g --network cassandra-net -e CASSANDRA_CLUSTER_NAME="fasteat-cluster" -e CASSANDRA_SEEDS="cassandra-1" -e CASSANDRA_BROADCAST_ADDRESS="cassandra-1" -p 9042:9042 cassandra
    # Nodo 2
    docker run -d --name cassandra-2 --memory=2g --network cassandra-net -e CASSANDRA_CLUSTER_NAME="fasteat-cluster" -e CASSANDRA_SEEDS="cassandra-1" -e CASSANDRA_BROADCAST_ADDRESS="cassandra-2" cassandra
    # Nodo 3
    docker run -d --name cassandra-3 --memory=2g --network cassandra-net -e CASSANDRA_CLUSTER_NAME="fasteat-cluster" -e CASSANDRA_SEEDS="cassandra-1" -e CASSANDRA_BROADCAST_ADDRESS="cassandra-3" cassandra
    ```
5. Acceder a la consola CQL de Cassandra
    ```zsh
    docker exec -it cassandra-1 cqlsh
    ```
6. Ejecutar el notebook principal
    Abre `test.ipynb` en Jupyter Notebook, selecciona el entorno virtual como kernel y sigue los ejemplos para conexión, creación de tablas, inserción y consulta de datos.
7. Estructura de Tablas y Consultas
    - Usuarios: tabla `users` con datos personales y ubicación.
    - Pedidos: tabla `orders_by_user` para registrar pedidos por usuario y fecha.
    - Consultas de ejemplo en el notebook para inserción, actualización y recuperación de datos.

### Recomendaciones
- Mantén el entorno virtual activado para evitar conflictos de dependencias.
- No subas archivos del entorno virtual ni datos sensibles al repositorio.
- Consulta el notebook y el PDF adjunto para detalles técnicos y justificación del diseño.

### Autores
- Proyecto académico para prácticas de bases de datos distribuidas y NoSQL.
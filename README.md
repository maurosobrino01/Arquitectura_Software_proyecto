# Tienda Online API

**Autor:** Mauro Sobrino Castro

## Descripción

API REST desarrollada en Python con **FastAPI** que gestiona una tienda online.
Permite dar de alta usuarios y productos, consultar el stock y realizar pedidos.
La lógica de negocio está en una capa de servicio (`TiendaService`) separada de
la capa de exposición (la API), y los errores de negocio se traducen a códigos HTTP.

Proyecto de la asignatura **Arquitectura del Software** (Prácticas 2 y 3).

## Estructura del proyecto

```
.
├── src/
│   ├── main.py              # API REST (FastAPI)
│   ├── schemas.py           # Modelos Pydantic de entrada/salida
│   ├── demo.py              # Demo por consola, sin API
│   ├── models/              # Usuario, Producto, Pedido
│   ├── Services/            # TiendaService y excepciones de negocio
│   └── tests/               # Tests de la API (pytest)
├── requirements.txt
└── README.md
```

## Endpoints

| Método | Ruta | Descripción |
|--------|------|-------------|
| POST   | `/usuarios` | Crear usuario |
| GET    | `/usuarios` | Listar usuarios |
| GET    | `/usuarios/{usuario_id}` | Obtener un usuario |
| POST   | `/productos` | Crear producto |
| GET    | `/productos` | Listar productos |
| GET    | `/productos/{producto_id}` | Obtener un producto |
| GET    | `/productos/{producto_id}/stock` | Consultar stock |
| DELETE | `/productos/{producto_id}` | Eliminar producto |
| POST   | `/pedidos` | Realizar un pedido |
| GET    | `/usuarios/{cliente_id}/pedidos` | Pedidos de un cliente |



## Docker

### Construir la imagen

Desde la raíz del repositorio:

```bash
docker build -t tienda-online-api:1.0 .
```

### Ejecutar el contenedor

```bash
docker run --rm -p 8000:8000 tienda-online-api:1.0
```

En segundo plano y con nombre:

```bash
docker run -d --name tienda -p 8000:8000 tienda-online-api:1.0
docker logs -f tienda
docker stop tienda
```

### Variables de entorno

La aplicación no necesita variables de entorno. El contenedor define
`PYTHONUNBUFFERED=1` y `PYTHONDONTWRITEBYTECODE=1` para que los logs salgan
al momento y no se generen ficheros `.pyc`.

### Salida esperada y pruebas

Al arrancar, uvicorn muestra:

```
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
```

- Documentación interactiva: http://localhost:8000/docs
- Listar productos (al inicio devuelve `[]`):

```bash
curl http://localhost:8000/productos
```

- Crear un usuario:

```bash
curl -X POST http://localhost:8000/usuarios \
  -H "Content-Type: application/json" \
  -d '{"nombre": "María López", "email": "maria@email.com", "tipo": "cliente", "direccion": "Calle Rosalía de Castro 10"}'
```

### Descargar la imagen desde Docker Hub

```bash
docker pull maurosobrino01/tienda-online-api:1.0
docker run --rm -p 8000:8000 maurosobrino01/tienda-online-api:1.0
```

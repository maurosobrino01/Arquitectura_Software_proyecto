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



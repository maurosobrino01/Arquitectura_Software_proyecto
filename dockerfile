# a. Imagen base ligera
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# b + c. Copiar e instalar dependencias (capa cacheada si no cambian)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# d. Copiar el código fuente
COPY src/ ./src/

# e. Usuario sin privilegios y permisos de ejecución
RUN useradd --create-home appuser \
    && chown -R appuser:appuser /app \
    && chmod -R u+rx /app/src
USER appuser

WORKDIR /app/src
EXPOSE 8000

# f. Comando de inicio
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

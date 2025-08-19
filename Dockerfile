FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        libpq-dev \
        gcc \
        python3-dev \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements*.txt /app/
RUN pip install --upgrade pip

# Install appropriate requirements based on environment
ARG USE_POSTGRESQL=false
RUN if [ "$USE_POSTGRESQL" = "true" ]; then \
        pip install -r requirements.txt; \
    else \
        pip install -r requirements-dev.txt; \
    fi

COPY . /app/

# Only collect static files in production
ARG COLLECT_STATIC=false
RUN if [ "$COLLECT_STATIC" = "true" ]; then \
        python manage.py collectstatic --noinput; \
    fi

RUN adduser --disabled-password --gecos '' appuser
RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

FROM debian:13.4-slim AS builder
COPY --from=ghcr.io/astral-sh/uv:0.10.11 /uv /uvx /bin/

ENV UV_PYTHON_INSTALL_DIR=/opt/python \
    UV_PYTHON_PREFERENCE=only-managed \
    UV_COMPILE_BYTECODE=1

WORKDIR /app

RUN uv python install 3.14t

COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-install-project --no-dev --no-editable

COPY src/. ./src/
COPY app.py .
RUN uv sync --frozen --no-dev --no-editable


FROM debian:13.4-slim

COPY --from=builder /opt/python /opt/python
COPY --from=builder /app /app

ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app

CMD [ "python3.14t", "app.py" ]

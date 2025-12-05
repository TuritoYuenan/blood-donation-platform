FROM ghcr.io/astral-sh/uv:alpine3.22

WORKDIR /app

COPY . .

RUN uv sync --locked

EXPOSE 8000

CMD [ "uv", "run", "fastapi", "run" ]

FROM ghcr.io/astral-sh/uv:alpine3.22

ENV DATABASE_URL=postgresql+psycopg://minhtriet:blood_platform@localhost/blood_platform

WORKDIR /app

COPY . .

RUN uv sync --locked

EXPOSE 8000

CMD [ "uv", "run", "fastapi", "run" ]

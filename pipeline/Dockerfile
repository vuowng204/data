FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

WORKDIR /app

# Add virtual environment to PATH so we can use installed packages (không cần lệnh uv run ở entry point nữa vì nó đã tự python ở /bin để chạy rồi)
ENV PATH="/app/.venv/bin:$PATH"


COPY pyproject.toml  uv.lock .python-version ./

RUN uv sync --locked

COPY ingest_data.py yellow_tripdata_2021-01.csv.gz ./

ENTRYPOINT ["python", "ingest_data.py"]
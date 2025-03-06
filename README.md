# Anki SyncServer

## Usage

### 1. Create a `.env` file

```bash
SYNC_USER1=user:pass
SYNC_BASE=/app/data/
```

### 2. Build and run the container

```
docker build -t anki-syncserver .
```

```
docker run --name anki-syncserver -d -p 8080:8080 -v ~/Library/CloudStorage/OneDrive-Personal/Anki:/app/data --env-file .env anki-syncserver
```

## About `SYNC_BASE`

`SYNC_BASE` is an environmental variable that lets you specify a custom directory (different from your Anki data folder) where the syncserver will store its copies of your Anki collection and media, ensuring they remain separate
from your primary data.

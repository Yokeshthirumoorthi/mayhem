import uvicorn

# Here, we instructed the file to run a Uvicorn server
# on port 8001 and reload on every file change.

if __name__ == "__main__":
    uvicorn.run("app.api:app", host="0.0.0.0", port=8001, reload=True)

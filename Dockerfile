FROM python:3.10.0-alpine3.15
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt 
COPY src src
EXPOSE 5000
HEALTHCHECK --interval=60s --timeout=60s --start-period=60s --retries=5 \
      CMD curl -f http://localhost:5000/health || exit 1
ENTRYPOINT ["python", "./src/app.py"]
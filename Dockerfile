FROM python:3.13.0b4-alpine3.20
RUN apk update && apk upgrade && apk add curl
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt 
COPY src src
EXPOSE 5000
HEALTHCHECK --interval=60s --timeout=60s --start-period=60s --retries=5 \
      CMD curl -f http://localhost:5000/health || exit 1
ENTRYPOINT ["python", "./src/app.py"]
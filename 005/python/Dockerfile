FROM python:3.9.15-slim
RUN mkdir app
COPY main.py app
COPY requirements.txt app
WORKDIR "app"
RUN pip install -r requirements.txt

ENTRYPOINT ["python", "main.py"]
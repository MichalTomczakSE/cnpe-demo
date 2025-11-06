FROM python:3.9-slim as builder
COPY . . 
RUN python -m venv /venv
RUN pip install -r requirements.txt
RUN /venv/bin/pip install --upgrade pip
RUN /venv/bin/pip install -r requirements.txt

FROM python:3.9-alpine
COPY --from=builder /venv /venv
COPY app.py . 
CMD ["/venv/bin/python", "app.py"] 

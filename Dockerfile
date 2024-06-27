FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

WORKDIR /code

COPY . /code

# ref: https://stackoverflow.com/questions/48561981/activate-python-virtualenv-in-dockerfile
RUN python -m venv /opt/venv
# Enable venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install uv
RUN uv pip install -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
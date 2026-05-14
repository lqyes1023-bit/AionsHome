# 1. 升级到 Python 3.11，满足 pyncm 的胃口
FROM python:3.11-slim

WORKDIR /app

# 2. 安装必要的系统组件
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc python3-dev && \
    rm -rf /var/lib/apt/lists/*

# 3. 升级 pip
RUN pip install --no-cache-dir --upgrade pip

# 4. 强行先喂饱 pyncm 这个“挑食怪”
RUN pip install --no-cache-dir pyncm || pip install --no-cache-dir pyncm==1.8.2

# 5. 安装剩下的所有依赖
COPY aion-chat/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt || true

# 6. 复制所有代码
COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["python", "aion-chat/main.py"]

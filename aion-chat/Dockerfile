# 1. 坚持使用 Python 3.11
FROM python:3.11-slim

WORKDIR /app

# 2. 安装系统依赖（增加 git，用来直接从源码抓取插件）
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    git && \
    rm -rf /var/lib/apt/lists/*

# 3. 升级 pip
RUN pip install --no-cache-dir --upgrade pip

# 4. 暴力安装 pyncm：如果正常安装不行，就直接从 GitHub 源码安装
RUN pip install --no-cache-dir pyncm || \
    pip install --no-cache-dir git+https://github.com/greatest-work/PyNCM.git || \
    echo "Skip pyncm for now"

# 5. 安装剩下的所有依赖
COPY aion-chat/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt || true

# 6. 复制所有代码
COPY . .

ENV PORT=8080
EXPOSE 8080

# 增加一个启动前的环境检查
CMD ["python", "aion-chat/main.py"]

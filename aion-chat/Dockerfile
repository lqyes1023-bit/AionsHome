# 使用更稳定的官方基础镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 提前安装 Git 和基础编译工具
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 升级工具
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 直接安装 pyncm (直接指向 GitHub 稳定源码)
RUN pip install --no-cache-dir git+https://github.com/greatest-work/PyNCM.git

# 复制依赖文件并安装 (加一个 --no-deps 避免依赖冲突)
COPY aion-chat/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目代码
COPY . .

# 环境变量
ENV PORT=8080
ENV PYTHONUNBUFFERED=1

# 启动命令
CMD ["python", "aion-chat/main.py"]

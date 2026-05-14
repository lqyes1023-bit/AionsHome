# 使用更稳定的基础镜像
FROM python:3.10-slim

# 设置工作目录
WORKDIR /app

# 预安装基础工具
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc python3-dev && \
    rm -rf /var/lib/apt/lists/*

# 升级 pip
RUN pip install --no-cache-dir --upgrade pip

# 先只复制依赖文件（这样构建更稳）
COPY aion-chat/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 复制剩下的所有代码
COPY . .

# 环境变量设置
ENV PORT=8080
EXPOSE 8080

# 启动命令
CMD ["python", "aion-chat/main.py"]

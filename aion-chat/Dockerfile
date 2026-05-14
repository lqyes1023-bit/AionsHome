FROM python:3.10-slim
WORKDIR /app

# 1. 升级工具
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 2. 复制整个大仓库（在大门口施工必须全拿进来）
COPY . .

# 3. 强行解决那个讨厌的 pyncm 报错
RUN pip install --no-cache-dir pyncm==1.8.2 || pip install --no-cache-dir pyncm --pre || echo "Skip pyncm error"

# 4. 指向子目录安装（注意路径）
RUN pip install --no-cache-dir -r aion-chat/requirements.txt || true

EXPOSE 8080

# 5. 指向子目录启动
CMD ["python", "aion-chat/main.py"]

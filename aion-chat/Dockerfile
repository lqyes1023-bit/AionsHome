FROM python:3.10-slim
WORKDIR /app

# 1. 升级工具
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 2. 复制整个项目（为了在大门口能看到所有房间）
COPY . .

# 3. 强行解决 pyncm 报错
RUN pip install --no-cache-dir pyncm==1.8.2 || pip install --no-cache-dir pyncm --pre || echo "Skip pyncm error"

# 4. 指向子目录下的依赖清单安装
RUN pip install --no-cache-dir -r aion-chat/requirements.txt || true

EXPOSE 8080

# 5. 指向子目录启动
CMD ["python", "aion-chat/main.py"]

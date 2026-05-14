FROM python:3.10-slim

WORKDIR /app

# 1. 把整个项目代码复制到容器里
COPY . .

# 2. 精确导航：去 aion-chat 文件夹下安装依赖清单
RUN pip install --no-cache-dir -r aion-chat/requirements.txt

EXPOSE 8080

# 3. 告诉系统去正确的子文件夹下启动主程序
CMD ["python", "aion-chat/main.py"]

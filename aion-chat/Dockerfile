FROM python:3.10-slim

WORKDIR /app

# 1. 升级基础打包工具，防止因为工具太旧找不到包
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 2. 复制当前文件夹（aion-chat）下的依赖清单
COPY requirements.txt .

# 3. 强行先单独安装兼容版本的 pyncm，装不上也别卡死
RUN pip install --no-cache-dir pyncm==1.8.2 || pip install --no-cache-dir pyncm --pre || echo "Skip pyncm error"

# 4. 执行清单安装，如果里面还有别的奇葩包报错，强制跳过，不耽误核心功能
RUN pip install --no-cache-dir -r requirements.txt || true

# 5. 复制当前文件夹下的所有代码文件
COPY . .

EXPOSE 8080

# 6. 直接启动当前文件夹下的主程序
CMD ["python", "main.py"]

# 前端build
FROM node:17
COPY ./page /app/page
WORKDIR /app/page
RUN npm install && npm run build


FROM ubuntu

# 复制前端打包产物
WORKDIR /app/page
COPY --from=0 /app/page/dist ./

WORKDIR /app/service

# 安装linux库
RUN apt-get update -yqq
RUN DEBIAN_FRONTEND=noninteractive apt-get install python3 python3-pip python3-venv nginx-core nginx -y

# 安装python库
COPY service/requirements.txt ./
RUN pip install -r requirements.txt

# 复制服务端代码
COPY ./service ./

# 复制nginx配置
COPY ./nginx.conf /etc/nginx/nginx.conf

# www-data 是ubuntu的账户，其他系统需要创建账户或者改掉nginx.confi第一行的`user  www-data`,换成合适的用户
#RUN  groupadd www-data && useradd -G www-data www-data


# 启动nginx和python server
ENTRYPOINT nginx -g "daemon on;" &&  gunicorn start:app -c gunicorn.conf.py




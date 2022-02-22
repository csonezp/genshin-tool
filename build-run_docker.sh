#bash
docker build . -t my-app && docker run -d -p 8088:80 my-app
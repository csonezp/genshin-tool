#bash
cd ./page
npm install && npm run build
cd ../service
gunicorn start:app -c gunicorn.conf.py
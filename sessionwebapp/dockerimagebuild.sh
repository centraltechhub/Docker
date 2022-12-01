docker build . -t centraltechhub/sessionwebapp:v1
docker run -idt -p 9080:9080 --name sessionwebapp centraltechhub/sessionwebapp:v1
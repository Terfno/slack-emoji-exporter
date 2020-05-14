INAME:=terfno/see
CNAME:=see

dev:
	@docker run -it --rm alpine:3.11 sh

build:
	@docker build -t '${INAME}' .

run:
	@docker run --name ${CNAME} -itd ${INAME} sh

exec:
	@docker exec -it ${CNAME} sh

start:
	@docker start ${CNAME}

stop:
	@docker stop ${CNAME}

push:
	@docker push ${INAME}

# rm
rm:
	@docker rm ${CNAME}

rmi:
	@docker rmi ${INAME}

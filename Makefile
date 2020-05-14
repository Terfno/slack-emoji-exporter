INAME:=node:14.2.0-alpine3.11
CNAME:=see

dev:
	@docker run -it --rm --name ${CNAME} -v ${PWD}:/node -w /node ${INAME} sh

exec:
	@docker exec -it ${CNAME} sh

start:
	@docker start ${CNAME}

stop:
	@docker stop ${CNAME}

# rm
rm:
	@docker rm ${CNAME}

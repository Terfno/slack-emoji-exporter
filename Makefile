INAME:=terfno/see
CNAME:=see

set:
	@mkdir emojis
	@touch .env &&\
	echo "Put the apitoken as a key in .env"

ready:
	@docker build -t '${INAME}' .

go:
	@docker run -v ${PWD}/emojis:/node/emojis --name ${CNAME} ${INAME}

exec:
	@docker exec -it ${CNAME} sh

start:
	@docker start ${CNAME}

stop:
	@docker stop ${CNAME}

# rm
rm:
	@docker rm ${CNAME}

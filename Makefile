.PHONY: deploy
deploy:
	hugo
	scp -r ./public* $(SFTP_USER)@$(SFTP_HOSTNAME):$(SFTP_PATH)
	rm -rf ./public
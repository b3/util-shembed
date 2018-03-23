# FreeBSD & GNU sed do not use the same option for ERE
SED=sed$(shell { sed v </dev/null >/dev/null 2>&1 && echo " -r" ; } || echo " -E" ) 

help:                           ## list available targets
	@eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-15s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))

##############################################################################

.PHONY: clean test pull push

clean:                          ## remove unuseful files
	-rm -f $(shell find . -name "*~")

test:                           ## run tests
	test/test-shembed -f -v

pull:                           ## pull from my repositories
	git pull boulgour master
	git pull github master

push: pull                      ## push to my repositories
	git push --all boulgour
	git push --all github

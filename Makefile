.PHONY: test
test:
	bash '$(CURDIR)/test_util.sh' gen
	python '$(CURDIR)/ename_test.py' -b

.PHONY: clean
clean:
	bash '$(CURDIR)/test_util.sh' clean

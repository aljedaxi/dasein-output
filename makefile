serve:
	npx serve result

result/articles:
	@./dump-html $@ 1>&2
	@npx prettier -w $@/*

result/index.html: result/articles
	@ls $< | janet index.janet | npx prettier --parser=html > $@

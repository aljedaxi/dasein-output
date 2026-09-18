serve:
	npx serve result

result/articles:
	@./dump-html $@ 1>&2
	@npx prettier -w $@/*


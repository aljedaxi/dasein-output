result: clean result/articles result/index.html result/feed.rss

serve:
	npx serve result

clean:
	@rm article-names

article-names:
	@sd zettel api > $@

og: 
	@find result/articles | grep index.html | xargs nix run github:aljedaxi/open-grapher > $@

result/feed.rss: og
	@nix run github:aljedaxi/ogp2rss < $< > $@

result/articles: article-names
	@./dump-html $@ < $< 1>&2
	@npx prettier -w $@/*

result/index.html: result/articles
	@ls $< | janet index.janet | npx prettier --parser=html > $@

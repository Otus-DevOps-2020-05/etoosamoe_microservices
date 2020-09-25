
USERNAME = etosamoe
VPATH = src:monitoring

build: build_ui build_comment build_post build_prometheus
build_ui: ui
	docker build -t $(USERNAME)/ui $^
build_comment: comment
	docker build -t $(USERNAME)/comment $^
build_post: post-py
	docker build -t $(USERNAME)/post $^
build_prometheus: prometheus
	docker build -t $(USERNAME)/prometheus $^

push: push_comment push_ui push_post push_prometheus
push_comment: comment
	docker push $(USERNAME)/comment
push_ui: ui
	docker push $(USERNAME)/ui
push_post: post-py
	docker push $(USERNAME)/post
push_prometheus: prometheus
	docker push $(USERNAME)/prometheus

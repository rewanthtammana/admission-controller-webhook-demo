# Copyright (c) 2019 StackRox Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Makefile for building the Admission Controller webhook demo server + docker image.

.DEFAULT_GOAL := docker-image

IMAGE ?= rewanthtammana/admission-controller-webhook-demo:1.23.make.v1api

bin/webhook-server: $(shell find . -name '*.go')
	cd ./cmd/webhook-server && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o $@ . && cp ./bin/webhook-server ../../image && rm -r ./bin/

.PHONY: docker-image
docker-image: bin/webhook-server
	docker build -t $(IMAGE) image/

.PHONY: push-image
push-image: docker-image
	docker push $(IMAGE)

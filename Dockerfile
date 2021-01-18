FROM golang:alpine AS build

WORKDIR /go/src/app
COPY . .

RUN set -ex \
 && CGO_ENABLED=0 go install -a -ldflags '-w -s -extldflags "-static"'

FROM scratch

COPY --from=build /go/bin/govanityurls /govanityurls

ENTRYPOINT ["/govanityurls"]

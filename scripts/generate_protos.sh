#!/bin/bash

export SRC_DIR=api/protos
export DST_DIR=pkg/
export SWAGGER_OUT_DIR=docs/swagger

#Greeting Service
export GREETING_PROTO=$SRC_DIR/v1/greeting.proto

protoc -I=$SRC_DIR --go_out=plugins=grpc:$DST_DIR $GREETING_PROTO
protoc -I=$SRC_DIR --grpc-gateway_out=logtostderr=true:$DST_DIR $GREETING_PROTO
protoc -I=$SRC_DIR --swagger_out=logtostderr=true:$SWAGGER_OUT_DIR $GREETING_PROTO

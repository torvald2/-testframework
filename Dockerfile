#Build K6
FROM golang as gobuild 
RUN go get -u github.com/k6io/xk6/cmd/xk6
RUN mkdir temp
COPY ./xk6_atb_tools temp
RUN readlink -f ./temp/init.go
RUN xk6  build v0.30.0 --with github.com/torvald2/k6x_atb_tools


# #Build tests 
# FROM node as testbuild
# RUN yarn add webpack webpack-dev-server --dev
# WORKDIR /test
# COPY ./testProject .
# RUN yarn webpack

#Main image
FROM alpine
WORKDIR /app
COPY --from=gobuild /go/k6 /app/k6
COPY ./test.js /app/test/test.js
RUN ls /app/
ENV K6_INFLUXDB_USERNAME=admin
ENV K6_INFLUXDB_PASSWORD=admin

RUN pwd

ENTRYPOINT ["./k6"]
CMD ["run", "/app/test/test.js"]

FROM alpine AS build
RUN apk add --no-cache build-base make automake autoconf git pkgconfig glib-dev gtest-dev gtest cmake

WORKDIR /home/optima
RUN git clone --branch branchHTTPserver https://github.com/Dasha05896/lab2.git
WORKDIR /home/optima/lab2

RUN autoconf
RUN ./configure
RUN cmake

FROM alpine
COPY --from=build /home/optima/lab2/myprogram /usr/local/bin/myprogram
ENTRYPOINT ["/usr/local/bin/myprogram"]

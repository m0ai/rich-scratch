FROM alpine AS builder
RUN apk --no-cache add ca-certificates tzdata

# rich-scratch
FROM scratch
# For System Timezone
COPY --from=builder /usr/local/go/lib/time/zoneinfo.zip /usr/local/go/lib/time/zoneinfo.zip
# For Https Protocal
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

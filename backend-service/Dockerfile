# Build the binary
FROM ekidd/rust-musl-builder:latest as builder

WORKDIR /app
ADD --chown=rust:rust . ./
RUN sudo chown -R rust:rust /app && \
    cargo build --release

# Copy the binary into alpine & run
FROM alpine:latest

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/backend-service /usr/local/bin/
CMD /usr/local/bin/backend-service
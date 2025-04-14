FROM toolbox-nvim-base

RUN apk add --no-cache rust cargo rustup

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup \
    --quiet \
    --default-toolchain stable \
    --no-modify \
    -y

RUN cargo install --locked --version 1.65.0 cargo-watch

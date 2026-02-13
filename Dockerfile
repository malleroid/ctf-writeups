FROM rust:alpine@sha256:4fec02de605563c297c78a31064c8335bc004fa2b0bf406b1b99441da64e2d2d AS builder

# renovate: datasource=crate depName=mdbook
ARG MDBOOK_VERSION=0.5.1

# Plugins
# renovate: datasource=crate depName=mdbook-mermaid
ARG MDBOOK_MERMAID_VERSION=0.17.0

# Use cache mounts to persist cargo registry and build artifacts
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/usr/local/cargo/git \
    --mount=type=cache,target=/root/.cargo \
    cargo install mdbook --version "${MDBOOK_VERSION}" --locked

RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/usr/local/cargo/git \
    --mount=type=cache,target=/root/.cargo \
    cargo install mdbook-mermaid --version "${MDBOOK_MERMAID_VERSION}" --locked

FROM builder AS development

WORKDIR /book

COPY book.toml ./
COPY src src

RUN mdbook-mermaid install .

EXPOSE 3000

CMD ["mdbook", "serve", "--hostname", "0.0.0.0"]

FROM builder AS ci-builder

WORKDIR /data

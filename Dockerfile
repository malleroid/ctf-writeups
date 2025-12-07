FROM rust:alpine

# Install build dependencies
# RUN apk add --no-cache musl-dev gcc

# renovate: datasource=crate depName=mdbook
ARG MDBOOK_VERSION=0.5.1

# Plugins
# renovate: datasource=crate depName=mdbook-mermaid
ARG MDBOOK_MERMAID_VERSION=0.17.0

RUN cargo install mdbook --version "${MDBOOK_VERSION}" --locked \
 && cargo install mdbook-mermaid   --version "${MDBOOK_MERMAID_VERSION}" --locked

WORKDIR /book

COPY book.toml ./
COPY src src

RUN mdbook-mermaid install .

EXPOSE 3000

CMD ["mdbook", "serve", "--hostname", "0.0.0.0"]

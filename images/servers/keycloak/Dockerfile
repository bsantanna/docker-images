ARG KEYCLOAK_VERSION=26.8.2

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} AS builder

RUN /opt/keycloak/bin/kc.sh build --db=postgres --health-enabled=true --metrics-enabled=true

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}
ENV REFRESHED_AT=2026-11-06

COPY --from=builder /opt/keycloak/ /opt/keycloak/

WORKDIR /opt/keycloak

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized", "--http-enabled=true", "--hostname-strict=false"]

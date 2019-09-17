include(`capitalize.m4')dnl
define(`CAPITALIZED_COMPONENT', `capitalize(COMPONENT)')dnl
define(`CAPITALIZED_SUBCOMPONENT', `capitalize(SUBCOMPONENT)')dnl
define(`GO_PACKAGE', `patsubst(SUBCOMPONENT, `-', `/')')dnl
FROM rhel8/go-toolset:1.12.8 AS builder
WORKDIR /opt/app-root/src/go/src/github.com/knative/COMPONENT
COPY . .
RUN go build -o /tmp/SUBCOMPONENT ./cmd/GO_PACKAGE

FROM ubi8:8-released
COPY --from=builder /tmp/SUBCOMPONENT /usr/bin/SUBCOMPONENT

LABEL \
      com.redhat.component="openshift-serverless-1-tech-preview-COMPONENT-SUBCOMPONENT-rhel8-container" \
      name="openshift-serverless-1-tech-preview/COMPONENT-SUBCOMPONENT-rhel8" \
      version="0.7.1" \
      summary="Red Hat OpenShift Serverless 1 CAPITALIZED_COMPONENT CAPITALIZED_SUBCOMPONENT" \
      maintainer="mthoemme@redhat.com" \
      description="Red Hat OpenShift Serverless 1 CAPITALIZED_COMPONENT CAPITALIZED_SUBCOMPONENT" \
      io.k8s.display-name="Red Hat OpenShift Serverless 1 CAPITALIZED_COMPONENT CAPITALIZED_SUBCOMPONENT"

ENTRYPOINT ["/usr/bin/SUBCOMPONENT"]

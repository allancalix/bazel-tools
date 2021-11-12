"""Defines third party dependencies for building this workspace."""

load("@bazel_gazelle//:deps.bzl", "go_repository")

def go_vendor():
    """DO NOT MANUALLY EDIT. This function is managed by gazelle."""

    go_repository(
        name = "com_github_99designs_gqlgen",
        importpath = "github.com/99designs/gqlgen",
        sum = "h1:Wg8aNYQUjMR/4v+W3xD+7SizOy6lSvVeQ06AobNQAXI=",
        version = "v0.14.0",
    )

    go_repository(
        name = "com_github_adrg_xdg",
        importpath = "github.com/adrg/xdg",
        sum = "h1:RzRqFcjH4nE5C6oTAxhBtoE2IRyjBSa62SCbyPidvls=",
        version = "v0.4.0",
    )

    go_repository(
        name = "com_github_agnivade_levenshtein",
        importpath = "github.com/agnivade/levenshtein",
        sum = "h1:QY8M92nrzkmr798gCo3kmMyqXFzdQVpxLlGPRBij0P8=",
        version = "v1.1.1",
    )

    go_repository(
        name = "com_github_andybalholm_cascadia",
        importpath = "github.com/andybalholm/cascadia",
        sum = "h1:vuRCkM5Ozh/BfmsaTm26kbjm0mIOM3yS5Ek/F5h18aE=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_antchfx_htmlquery",
        importpath = "github.com/antchfx/htmlquery",
        sum = "h1:sP3NFDneHx2stfNXCKbhHFo8XgNjCACnU/4AO5gWz6M=",
        version = "v1.2.3",
    )
    go_repository(
        name = "com_github_antchfx_xmlquery",
        importpath = "github.com/antchfx/xmlquery",
        sum = "h1:T/SH1bYdzdjTMoz2RgsfVKbM5uWh3gjDYYepFqQmFv4=",
        version = "v1.2.4",
    )
    go_repository(
        name = "com_github_antchfx_xpath",
        importpath = "github.com/antchfx/xpath",
        sum = "h1:PcL6bIX42Px5usSx6xRYw/wjB3wYGkj0MJ9MBzEKVgk=",
        version = "v1.1.8",
    )
    go_repository(
        name = "com_github_cenkalti_backoff_v4",
        importpath = "github.com/cenkalti/backoff/v4",
        sum = "h1:G2HAfAmvm/GcKan2oOQpBXOd2tT2G57ZnZGWa1PxPBQ=",
        version = "v4.1.1",
    )

    go_repository(
        name = "com_github_containerd_continuity",
        importpath = "github.com/containerd/continuity",
        sum = "h1:j/9Wnn+hrEWjLvHuIxUU1YI5JjEjVlT2AA68cse9rwY=",
        version = "v0.2.0",
    )

    go_repository(
        name = "com_github_frankban_quicktest",
        importpath = "github.com/frankban/quicktest",
        sum = "h1:yNZif1OkDfNoDfb9zZa9aXIpejNR4F23Wely0c+Qdqk=",
        version = "v1.13.0",
    )
    go_repository(
        name = "com_github_getsentry_sentry_go",
        importpath = "github.com/getsentry/sentry-go",
        sum = "h1:qro8uttJGvNAMr5CLcFI9CHR0aDzXl0Vs3Pmw/oTPg8=",
        version = "v0.11.0",
    )

    go_repository(
        name = "com_github_gobwas_glob",
        importpath = "github.com/gobwas/glob",
        sum = "h1:A4xDbljILXROh+kObIiy5kIaPYD8e96x1tgBhUI5J+Y=",
        version = "v0.2.3",
    )

    go_repository(
        name = "com_github_gocolly_colly",
        importpath = "github.com/gocolly/colly",
        sum = "h1:qRz9YAn8FIH0qzgNUw+HT9UN7wm1oF9OBAilwEWpyrI=",
        version = "v1.2.0",
    )

    go_repository(
        name = "com_github_golang_migrate_migrate_v4",
        importpath = "github.com/golang-migrate/migrate/v4",
        sum = "h1:Sakl3Nm6+wQKq0Q62tpFMi5a503bgGhceo2icrgQ9vM=",
        version = "v4.15.1",
    )

    go_repository(
        name = "com_github_golang_protobuf",
        importpath = "github.com/golang/protobuf",
        sum = "h1:ROPKBNFfQgOUMifHyP+KYbvpjbdoFNs+aK7DXlji0Tw=",
        version = "v1.5.2",
    )

    go_repository(
        name = "com_github_google_uuid",
        importpath = "github.com/google/uuid",
        sum = "h1:t6JiXgmwXMjEs8VusXIJk2BXHsn+wx8BZdTaoZ5fu7I=",
        version = "v1.3.0",
    )
    go_repository(
        name = "com_github_google_wire",
        importpath = "github.com/google/wire",
        sum = "h1:I7ELFeVBr3yfPIcc8+MWvrjk+3VjbcSzoXm3JVa+jD8=",
        version = "v0.5.0",
    )

    go_repository(
        name = "com_github_gorilla_mux",
        importpath = "github.com/gorilla/mux",
        sum = "h1:i40aqfkR1h2SlN9hojwV5ZA91wcXFOvkdNIeFDP5koI=",
        version = "v1.8.0",
    )
    go_repository(
        name = "com_github_grpc_ecosystem_go_grpc_middleware",
        importpath = "github.com/grpc-ecosystem/go-grpc-middleware",
        sum = "h1:+9834+KizmvFV7pXQGSXQTsaWhq2GjuNUt0aUU0YBYw=",
        version = "v1.3.0",
    )
    go_repository(
        name = "com_github_grpc_ecosystem_go_grpc_prometheus",
        importpath = "github.com/grpc-ecosystem/go-grpc-prometheus",
        sum = "h1:Ovs26xHkKqVztRpIrF/92BcuyuQ/YW4NSIpoGtfXNho=",
        version = "v1.2.0",
    )

    go_repository(
        name = "com_github_hashicorp_errwrap",
        importpath = "github.com/hashicorp/errwrap",
        sum = "h1:OxrOeh75EUXMY8TBjag2fzXGZ40LB6IKw45YeGUDY2I=",
        version = "v1.1.0",
    )

    go_repository(
        name = "com_github_hashicorp_go_getter",
        importpath = "github.com/hashicorp/go-getter",
        sum = "h1:b7ahZW50iQiUek/at3CvZhPK1/jiV6CtKcsJiR6E4R0=",
        version = "v1.5.9",
    )

    go_repository(
        name = "com_github_hashicorp_go_multierror",
        importpath = "github.com/hashicorp/go-multierror",
        sum = "h1:H5DkEtf6CXdFp0N0Em5UCwQpXMWke8IA0+lD48awMYo=",
        version = "v1.1.1",
    )

    go_repository(
        name = "com_github_hashicorp_golang_lru",
        importpath = "github.com/hashicorp/golang-lru",
        sum = "h1:YDjusn29QI/Das2iO9M0BHnIbxPeyuCHsjMW+lJfyTc=",
        version = "v0.5.4",
    )

    go_repository(
        name = "com_github_hashicorp_levant",
        importpath = "github.com/hashicorp/levant",
        sum = "h1:r9uhQqoSk/T7FqcW7L6V+Z+2VNienzB5vFsxCJbqNDM=",
        version = "v0.3.0",
    )
    go_repository(
        name = "com_github_jackc_pgconn",
        importpath = "github.com/jackc/pgconn",
        sum = "h1:4EYhlDVEMsJ30nNj0mmgwIUXoq7e9sMJrVC2ED6QlCU=",
        version = "v1.10.0",
    )
    go_repository(
        name = "com_github_jackc_pgerrcode",
        importpath = "github.com/jackc/pgerrcode",
        sum = "h1:WAvSpGf7MsFuzAtK4Vk7R4EVe+liW4x83r4oWu0WHKw=",
        version = "v0.0.0-20201024163028-a0d42d470451",
    )
    go_repository(
        name = "com_github_jackc_pgtype",
        importpath = "github.com/jackc/pgtype",
        sum = "h1:9k0IXtdJXHJbyAWQgbWr1lU+MEhPXZz6RIXxfR5oxXs=",
        version = "v1.8.1",
    )
    go_repository(
        name = "com_github_jackc_pgx",
        importpath = "github.com/jackc/pgx",
        sum = "h1:2zP5OD7kiyR3xzRYMhOcXVvkDZsImVXfj+yIyTQf3/o=",
        version = "v3.6.2+incompatible",
    )
    go_repository(
        name = "com_github_jackc_pgx_v4",
        importpath = "github.com/jackc/pgx/v4",
        sum = "h1:JCjhT5vmhMAf/YwBHLvrBn4OGdIQBiFG6ym8Zmdx570=",
        version = "v4.13.0",
    )

    go_repository(
        name = "com_github_kennygrant_sanitize",
        importpath = "github.com/kennygrant/sanitize",
        sum = "h1:gN25/otpP5vAsO2djbMhF/LQX6R7+O1TB4yv8NzpJ3o=",
        version = "v1.2.4",
    )

    go_repository(
        name = "com_github_mennanov_fmutils",
        importpath = "github.com/mennanov/fmutils",
        sum = "h1:7GAoy/WI1ZUJDmuyB/i33DrL+E9ruj6BXv2GMqIBtj0=",
        version = "v0.1.1",
    )

    go_repository(
        name = "com_github_mitchellh_mapstructure",
        importpath = "github.com/mitchellh/mapstructure",
        sum = "h1:6h7AQ0yhTcIsmFmnAwQls75jp2Gzs4iB8W7pjMO+rqo=",
        version = "v1.4.2",
    )

    go_repository(
        name = "com_github_oklog_ulid_v2",
        importpath = "github.com/oklog/ulid/v2",
        sum = "h1:r4fFzBm+bv0wNKNh5eXTwU7i85y5x+uwkxCUTNVQqLc=",
        version = "v2.0.2",
    )

    go_repository(
        name = "com_github_open_policy_agent_opa",
        importpath = "github.com/open-policy-agent/opa",
        sum = "h1:asRmfDRUSd8gwPNRrpUsDxwOUkxLgc1x1FYkwjcnag4=",
        version = "v0.34.2",
    )
    go_repository(
        name = "com_github_ory_dockertest_v3",
        importpath = "github.com/ory/dockertest/v3",
        sum = "h1:i5b0cJCd801qw0cVQUOH6dSpI9fT3j5tdWu0jKu90ks=",
        version = "v3.8.0",
    )
    go_repository(
        name = "com_github_ory_kratos_client_go",
        importpath = "github.com/ory/kratos-client-go",
        sum = "h1:YxXJwz3/gDjXOxOV/Sc6AkSMde8MhmPiWZ7r0GdvxH4=",
        version = "v0.8.0-alpha.2",
    )

    go_repository(
        name = "com_github_prometheus_client_golang",
        importpath = "github.com/prometheus/client_golang",
        sum = "h1:HNkLOAEQMIDv/K+04rukrLx6ch7msSRwf3/SASFAGtQ=",
        version = "v1.11.0",
    )

    go_repository(
        name = "com_github_puerkitobio_goquery",
        importpath = "github.com/PuerkitoBio/goquery",
        sum = "h1:PSPBGne8NIUWw+/7vFBV+kG2J/5MOjbzc7154OaKCSE=",
        version = "v1.5.1",
    )

    go_repository(
        name = "com_github_saintfish_chardet",
        importpath = "github.com/saintfish/chardet",
        sum = "h1:NugYot0LIVPxTvN8n+Kvkn6TrbMyxQiuvKdEwFdR9vI=",
        version = "v0.0.0-20120816061221-3af4cd4741ca",
    )

    go_repository(
        name = "com_github_shopify_sarama",
        importpath = "github.com/Shopify/sarama",
        sum = "h1:TOZL6r37xJBDEMLx4yjB77jxbZYXPaDow08TSK6vIL0=",
        version = "v1.30.0",
    )

    go_repository(
        name = "com_github_slok_go_http_metrics",
        importpath = "github.com/slok/go-http-metrics",
        sum = "h1:o7A7j2DHs7Bnz8aGMotQLele28vf/Cl+O9cwJ6HyGk4=",
        version = "v0.9.0",
    )

    go_repository(
        name = "com_github_spf13_pflag",
        importpath = "github.com/spf13/pflag",
        sum = "h1:iy+VFUOCP1a+8yFto/drg2CJ5u0yRoB7fZw3DKv/JXA=",
        version = "v1.0.5",
    )
    go_repository(
        name = "com_github_spf13_viper",
        importpath = "github.com/spf13/viper",
        sum = "h1:yR6EXjTp0y0cLN8OZg1CRZmOBdI88UcGkhgyJhu6nZk=",
        version = "v1.9.0",
    )

    go_repository(
        name = "com_github_temoto_robotstxt",
        importpath = "github.com/temoto/robotstxt",
        sum = "h1:Gh8RCs8ouX3hRSxxK7B1mO5RFByQ4CmJZDwgom++JaA=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_vektah_gqlparser_v2",
        importpath = "github.com/vektah/gqlparser/v2",
        sum = "h1:bAc3slekAAJW6sZTi07aGq0OrfaCjj4jxARAaC7g2EM=",
        version = "v2.2.0",
    )

    go_repository(
        name = "com_github_xeipuuv_gojsonpointer",
        importpath = "github.com/xeipuuv/gojsonpointer",
        sum = "h1:zGWFAtiMcyryUHoUjUJX0/lt1H2+i2Ka2n+D3DImSNo=",
        version = "v0.0.0-20190905194746-02993c407bfb",
    )
    go_repository(
        name = "in_gopkg_square_go_jose_v2",
        importpath = "gopkg.in/square/go-jose.v2",
        sum = "h1:NGk74WTnPKBNUhNzQX7PYcTLUjoq7mzKk2OKbvwk2iI=",
        version = "v2.6.0",
    )
    go_repository(
        name = "org_golang_google_api",
        importpath = "google.golang.org/api",
        sum = "h1:eq/zs5WPH4J9undYM9IP1O7dSr7Yh8Y0GtSCpzGzIUk=",
        version = "v0.60.0",
    )
    go_repository(
        name = "org_golang_google_genproto",
        importpath = "google.golang.org/genproto",
        sum = "h1:FqrtZMB5Wr+/RecOM3uPJNPfWR8Upb5hAPnt7PU6i4k=",
        version = "v0.0.0-20211021150943-2b146023228c",
    )
    go_repository(
        name = "org_golang_google_grpc",
        importpath = "google.golang.org/grpc",
        sum = "h1:XT2/MFpuPFsEX2fWh3YQtHkZ+WYZFQRfaUgLZYj/p6A=",
        version = "v1.42.0",
    )
    go_repository(
        name = "org_golang_google_protobuf",
        importpath = "google.golang.org/protobuf",
        sum = "h1:SnqbnDw1V7RiZcXPx5MEeqPv2s79L9i7BJUlG/+RurQ=",
        version = "v1.27.1",
    )
    go_repository(
        name = "org_golang_x_oauth2",
        importpath = "golang.org/x/oauth2",
        sum = "h1:B333XXssMuKQeBwiNODx4TupZy7bf4sxFZnN2ZOcvUE=",
        version = "v0.0.0-20211005180243-6b3c2da341f1",
    )
    go_repository(
        name = "org_golang_x_sync",
        importpath = "golang.org/x/sync",
        sum = "h1:5KslGYwFpkhGh+Q16bwMP3cOontH8FOep7tGV86Y7SQ=",
        version = "v0.0.0-20210220032951-036812b2e83c",
    )
    go_repository(
        name = "org_golang_x_xerrors",
        importpath = "golang.org/x/xerrors",
        sum = "h1:go1bK/D/BFZV2I8cIQd1NKEZ+0owSTG1fDTci4IqFcE=",
        version = "v0.0.0-20200804184101-5ec99f83aff1",
    )
    go_repository(
        name = "org_uber_go_atomic",
        importpath = "go.uber.org/atomic",
        sum = "h1:ECmE8Bn/WFTYwEW/bpKD3M8VtR/zQVbavAoalC1PYyE=",
        version = "v1.9.0",
    )
    go_repository(
        name = "org_uber_go_multierr",
        importpath = "go.uber.org/multierr",
        sum = "h1:zaiO/rmgFjbmCXdSYJWQcdvOCsthmdaHfr3Gm2Kx4Ec=",
        version = "v1.7.0",
    )
    go_repository(
        name = "org_uber_go_zap",
        importpath = "go.uber.org/zap",
        sum = "h1:mZQZefskPPCMIBCSEH0v2/iUqqLrYtaeqwD6FUGUnFE=",
        version = "v1.19.0",
    )

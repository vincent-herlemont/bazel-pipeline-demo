"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def raze_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__aho_corasick__0_7_15",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.15/download",
        type = "tar.gz",
        sha256 = "7404febffaa47dac81aa44dba71523c9d069b1bdc50a77db41195149e17f68e5",
        strip_prefix = "aho-corasick-0.7.15",
        build_file = Label("//consumer/cargo/remote:BUILD.aho-corasick-0.7.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__amq_protocol__6_0_2",
        url = "https://crates.io/api/v1/crates/amq-protocol/6.0.2/download",
        type = "tar.gz",
        sha256 = "ede228647914ef8ac4ef4cfddbe3be4c23afea8d8c7f95451a2f53efe6ce8f2f",
        strip_prefix = "amq-protocol-6.0.2",
        build_file = Label("//consumer/cargo/remote:BUILD.amq-protocol-6.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__amq_protocol_tcp__6_0_2",
        url = "https://crates.io/api/v1/crates/amq-protocol-tcp/6.0.2/download",
        type = "tar.gz",
        sha256 = "4860b3d63ffb63b3ed440b78ccd549b009e0f72d995b9e9aec51e8e1af01e694",
        strip_prefix = "amq-protocol-tcp-6.0.2",
        build_file = Label("//consumer/cargo/remote:BUILD.amq-protocol-tcp-6.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__amq_protocol_types__6_0_2",
        url = "https://crates.io/api/v1/crates/amq-protocol-types/6.0.2/download",
        type = "tar.gz",
        sha256 = "73ebe159bbe5fff48b5702d639ba9b0a7b1b2f24c4404fe38db0cbcafd057c01",
        strip_prefix = "amq-protocol-types-6.0.2",
        build_file = Label("//consumer/cargo/remote:BUILD.amq-protocol-types-6.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__amq_protocol_uri__6_0_2",
        url = "https://crates.io/api/v1/crates/amq-protocol-uri/6.0.2/download",
        type = "tar.gz",
        sha256 = "f82403806f8fef7e9d8dc6dcb41839a47a8eab9419f9dca52ef6b19904e0047e",
        strip_prefix = "amq-protocol-uri-6.0.2",
        build_file = Label("//consumer/cargo/remote:BUILD.amq-protocol-uri-6.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__arrayvec__0_5_2",
        url = "https://crates.io/api/v1/crates/arrayvec/0.5.2/download",
        type = "tar.gz",
        sha256 = "23b62fc65de8e4e7f52534fb52b0f3ed04746ae267519eef2a83941e8085068b",
        strip_prefix = "arrayvec-0.5.2",
        build_file = Label("//consumer/cargo/remote:BUILD.arrayvec-0.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__async_task__4_0_3",
        url = "https://crates.io/api/v1/crates/async-task/4.0.3/download",
        type = "tar.gz",
        sha256 = "e91831deabf0d6d7ec49552e489aed63b7456a7a3c46cff62adad428110b0af0",
        strip_prefix = "async-task-4.0.3",
        build_file = Label("//consumer/cargo/remote:BUILD.async-task-4.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__async_trait__0_1_42",
        url = "https://crates.io/api/v1/crates/async-trait/0.1.42/download",
        type = "tar.gz",
        sha256 = "8d3a45e77e34375a7923b1e8febb049bb011f064714a8e17a1a616fef01da13d",
        strip_prefix = "async-trait-0.1.42",
        build_file = Label("//consumer/cargo/remote:BUILD.async-trait-0.1.42.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//consumer/cargo/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//consumer/cargo/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base64__0_13_0",
        url = "https://crates.io/api/v1/crates/base64/0.13.0/download",
        type = "tar.gz",
        sha256 = "904dfeac50f3cdaba28fc6f57fdcddb75f49ed61346676a78c4ffe55877802fd",
        strip_prefix = "base64-0.13.0",
        build_file = Label("//consumer/cargo/remote:BUILD.base64-0.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//consumer/cargo/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitvec__0_19_4",
        url = "https://crates.io/api/v1/crates/bitvec/0.19.4/download",
        type = "tar.gz",
        sha256 = "a7ba35e9565969edb811639dbebfe34edc0368e472c5018474c8eb2543397f81",
        strip_prefix = "bitvec-0.19.4",
        build_file = Label("//consumer/cargo/remote:BUILD.bitvec-0.19.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block_buffer__0_9_0",
        url = "https://crates.io/api/v1/crates/block-buffer/0.9.0/download",
        type = "tar.gz",
        sha256 = "4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a3417297e4",
        strip_prefix = "block-buffer-0.9.0",
        build_file = Label("//consumer/cargo/remote:BUILD.block-buffer-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_3_4",
        url = "https://crates.io/api/v1/crates/byteorder/1.3.4/download",
        type = "tar.gz",
        sha256 = "08c48aae112d48ed9f069b33538ea9e3e90aa263cfa3d1c24309612b1f7472de",
        strip_prefix = "byteorder-1.3.4",
        build_file = Label("//consumer/cargo/remote:BUILD.byteorder-1.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytes__0_5_6",
        url = "https://crates.io/api/v1/crates/bytes/0.5.6/download",
        type = "tar.gz",
        sha256 = "0e4cec68f03f32e44924783795810fa50a7035d8c8ebe78580ad7e6c703fba38",
        strip_prefix = "bytes-0.5.6",
        build_file = Label("//consumer/cargo/remote:BUILD.bytes-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytes__0_6_0",
        url = "https://crates.io/api/v1/crates/bytes/0.6.0/download",
        type = "tar.gz",
        sha256 = "e0dcbc35f504eb6fc275a6d20e4ebcda18cf50d40ba6fabff8c711fa16cb3b16",
        strip_prefix = "bytes-0.6.0",
        build_file = Label("//consumer/cargo/remote:BUILD.bytes-0.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cc__1_0_65",
        url = "https://crates.io/api/v1/crates/cc/1.0.65/download",
        type = "tar.gz",
        sha256 = "95752358c8f7552394baf48cd82695b345628ad3f170d607de3ca03b8dacca15",
        strip_prefix = "cc-1.0.65",
        build_file = Label("//consumer/cargo/remote:BUILD.cc-1.0.65.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        sha256 = "4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//consumer/cargo/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//consumer/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cloudabi__0_1_0",
        url = "https://crates.io/api/v1/crates/cloudabi/0.1.0/download",
        type = "tar.gz",
        sha256 = "4344512281c643ae7638bbabc3af17a11307803ec8f0fcad9fae512a8bf36467",
        strip_prefix = "cloudabi-0.1.0",
        build_file = Label("//consumer/cargo/remote:BUILD.cloudabi-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cookie_factory__0_3_1",
        url = "https://crates.io/api/v1/crates/cookie-factory/0.3.1/download",
        type = "tar.gz",
        sha256 = "41f21b581d2f0cb891554812435667bb9610d74feb1a4c6415bf09c28ff0381d",
        strip_prefix = "cookie-factory-0.3.1",
        build_file = Label("//consumer/cargo/remote:BUILD.cookie-factory-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__core_foundation__0_9_1",
        url = "https://crates.io/api/v1/crates/core-foundation/0.9.1/download",
        type = "tar.gz",
        sha256 = "0a89e2ae426ea83155dccf10c0fa6b1463ef6d5fcb44cee0b224a408fa640a62",
        strip_prefix = "core-foundation-0.9.1",
        build_file = Label("//consumer/cargo/remote:BUILD.core-foundation-0.9.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__core_foundation_sys__0_8_2",
        url = "https://crates.io/api/v1/crates/core-foundation-sys/0.8.2/download",
        type = "tar.gz",
        sha256 = "ea221b5284a47e40033bf9b66f35f984ec0ea2931eb03505246cd27a963f981b",
        strip_prefix = "core-foundation-sys-0.8.2",
        build_file = Label("//consumer/cargo/remote:BUILD.core-foundation-sys-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cpuid_bool__0_1_2",
        url = "https://crates.io/api/v1/crates/cpuid-bool/0.1.2/download",
        type = "tar.gz",
        sha256 = "8aebca1129a03dc6dc2b127edd729435bbc4a37e1d5f4d7513165089ceb02634",
        strip_prefix = "cpuid-bool-0.1.2",
        build_file = Label("//consumer/cargo/remote:BUILD.cpuid-bool-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_channel__0_5_0",
        url = "https://crates.io/api/v1/crates/crossbeam-channel/0.5.0/download",
        type = "tar.gz",
        sha256 = "dca26ee1f8d361640700bde38b2c37d8c22b3ce2d360e1fc1c74ea4b0aa7d775",
        strip_prefix = "crossbeam-channel-0.5.0",
        build_file = Label("//consumer/cargo/remote:BUILD.crossbeam-channel-0.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_8_1",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.8.1/download",
        type = "tar.gz",
        sha256 = "02d96d1e189ef58269ebe5b97953da3274d83a93af647c2ddd6f9dab28cedb8d",
        strip_prefix = "crossbeam-utils-0.8.1",
        build_file = Label("//consumer/cargo/remote:BUILD.crossbeam-utils-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crypto_mac__0_9_1",
        url = "https://crates.io/api/v1/crates/crypto-mac/0.9.1/download",
        type = "tar.gz",
        sha256 = "58bcd97a54c7ca5ce2f6eb16f6bede5b0ab5f0055fedc17d2f0b4466e21671ca",
        strip_prefix = "crypto-mac-0.9.1",
        build_file = Label("//consumer/cargo/remote:BUILD.crypto-mac-0.9.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__digest__0_9_0",
        url = "https://crates.io/api/v1/crates/digest/0.9.0/download",
        type = "tar.gz",
        sha256 = "d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3cc6dcb066",
        strip_prefix = "digest-0.9.0",
        build_file = Label("//consumer/cargo/remote:BUILD.digest-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__doc_comment__0_3_3",
        url = "https://crates.io/api/v1/crates/doc-comment/0.3.3/download",
        type = "tar.gz",
        sha256 = "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10",
        strip_prefix = "doc-comment-0.3.3",
        build_file = Label("//consumer/cargo/remote:BUILD.doc-comment-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__env_logger__0_8_2",
        url = "https://crates.io/api/v1/crates/env_logger/0.8.2/download",
        type = "tar.gz",
        sha256 = "f26ecb66b4bdca6c1409b40fb255eefc2bd4f6d135dab3c3124f80ffa2a9661e",
        strip_prefix = "env_logger-0.8.2",
        build_file = Label("//consumer/cargo/remote:BUILD.env_logger-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fallible_iterator__0_2_0",
        url = "https://crates.io/api/v1/crates/fallible-iterator/0.2.0/download",
        type = "tar.gz",
        sha256 = "4443176a9f2c162692bd3d352d745ef9413eec5782a80d8fd6f8a1ac692a07f7",
        strip_prefix = "fallible-iterator-0.2.0",
        build_file = Label("//consumer/cargo/remote:BUILD.fallible-iterator-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__foreign_types__0_3_2",
        url = "https://crates.io/api/v1/crates/foreign-types/0.3.2/download",
        type = "tar.gz",
        sha256 = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1",
        strip_prefix = "foreign-types-0.3.2",
        build_file = Label("//consumer/cargo/remote:BUILD.foreign-types-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__foreign_types_shared__0_1_1",
        url = "https://crates.io/api/v1/crates/foreign-types-shared/0.1.1/download",
        type = "tar.gz",
        sha256 = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b",
        strip_prefix = "foreign-types-shared-0.1.1",
        build_file = Label("//consumer/cargo/remote:BUILD.foreign-types-shared-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__form_urlencoded__1_0_0",
        url = "https://crates.io/api/v1/crates/form_urlencoded/1.0.0/download",
        type = "tar.gz",
        sha256 = "ece68d15c92e84fa4f19d3780f1294e5ca82a78a6d515f1efaabcc144688be00",
        strip_prefix = "form_urlencoded-1.0.0",
        build_file = Label("//consumer/cargo/remote:BUILD.form_urlencoded-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__funty__1_0_1",
        url = "https://crates.io/api/v1/crates/funty/1.0.1/download",
        type = "tar.gz",
        sha256 = "0ba62103ce691c2fd80fbae2213dfdda9ce60804973ac6b6e97de818ea7f52c8",
        strip_prefix = "funty-1.0.1",
        build_file = Label("//consumer/cargo/remote:BUILD.funty-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures__0_3_8",
        url = "https://crates.io/api/v1/crates/futures/0.3.8/download",
        type = "tar.gz",
        sha256 = "9b3b0c040a1fe6529d30b3c5944b280c7f0dcb2930d2c3062bca967b602583d0",
        strip_prefix = "futures-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_channel__0_3_8",
        url = "https://crates.io/api/v1/crates/futures-channel/0.3.8/download",
        type = "tar.gz",
        sha256 = "4b7109687aa4e177ef6fe84553af6280ef2778bdb7783ba44c9dc3399110fe64",
        strip_prefix = "futures-channel-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-channel-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_core__0_3_8",
        url = "https://crates.io/api/v1/crates/futures-core/0.3.8/download",
        type = "tar.gz",
        sha256 = "847ce131b72ffb13b6109a221da9ad97a64cbe48feb1028356b836b47b8f1748",
        strip_prefix = "futures-core-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-core-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_executor__0_3_8",
        url = "https://crates.io/api/v1/crates/futures-executor/0.3.8/download",
        type = "tar.gz",
        sha256 = "4caa2b2b68b880003057c1dd49f1ed937e38f22fcf6c212188a121f08cf40a65",
        strip_prefix = "futures-executor-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-executor-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_io__0_3_8",
        url = "https://crates.io/api/v1/crates/futures-io/0.3.8/download",
        type = "tar.gz",
        sha256 = "611834ce18aaa1bd13c4b374f5d653e1027cf99b6b502584ff8c9a64413b30bb",
        strip_prefix = "futures-io-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-io-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_macro__0_3_8",
        url = "https://crates.io/api/v1/crates/futures-macro/0.3.8/download",
        type = "tar.gz",
        sha256 = "77408a692f1f97bcc61dc001d752e00643408fbc922e4d634c655df50d595556",
        strip_prefix = "futures-macro-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-macro-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_sink__0_3_8",
        url = "https://crates.io/api/v1/crates/futures-sink/0.3.8/download",
        type = "tar.gz",
        sha256 = "f878195a49cee50e006b02b93cf7e0a95a38ac7b776b4c4d9cc1207cd20fcb3d",
        strip_prefix = "futures-sink-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-sink-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_task__0_3_8",
        url = "https://crates.io/api/v1/crates/futures-task/0.3.8/download",
        type = "tar.gz",
        sha256 = "7c554eb5bf48b2426c4771ab68c6b14468b6e76cc90996f528c3338d761a4d0d",
        strip_prefix = "futures-task-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-task-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_util__0_3_8",
        url = "https://crates.io/api/v1/crates/futures-util/0.3.8/download",
        type = "tar.gz",
        sha256 = "d304cff4a7b99cfb7986f7d43fbe93d175e72e704a8860787cc95e9ffd85cbd2",
        strip_prefix = "futures-util-0.3.8",
        build_file = Label("//consumer/cargo/remote:BUILD.futures-util-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__generic_array__0_14_4",
        url = "https://crates.io/api/v1/crates/generic-array/0.14.4/download",
        type = "tar.gz",
        sha256 = "501466ecc8a30d1d3b7fc9229b122b2ce8ed6e9d9223f1138d4babb253e51817",
        strip_prefix = "generic-array-0.14.4",
        build_file = Label("//consumer/cargo/remote:BUILD.generic-array-0.14.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_1_15",
        url = "https://crates.io/api/v1/crates/getrandom/0.1.15/download",
        type = "tar.gz",
        sha256 = "fc587bc0ec293155d5bfa6b9891ec18a1e330c234f896ea47fbada4cadbe47e6",
        strip_prefix = "getrandom-0.1.15",
        build_file = Label("//consumer/cargo/remote:BUILD.getrandom-0.1.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_17",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.17/download",
        type = "tar.gz",
        sha256 = "5aca5565f760fb5b220e499d72710ed156fdb74e631659e99377d9ebfbd13ae8",
        strip_prefix = "hermit-abi-0.1.17",
        build_file = Label("//consumer/cargo/remote:BUILD.hermit-abi-0.1.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hmac__0_9_0",
        url = "https://crates.io/api/v1/crates/hmac/0.9.0/download",
        type = "tar.gz",
        sha256 = "deae6d9dbb35ec2c502d62b8f7b1c000a0822c3b0794ba36b3149c0a1c840dff",
        strip_prefix = "hmac-0.9.0",
        build_file = Label("//consumer/cargo/remote:BUILD.hmac-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__humantime__2_0_1",
        url = "https://crates.io/api/v1/crates/humantime/2.0.1/download",
        type = "tar.gz",
        sha256 = "3c1ad908cc71012b7bea4d0c53ba96a8cba9962f048fa68d143376143d863b7a",
        strip_prefix = "humantime-2.0.1",
        build_file = Label("//consumer/cargo/remote:BUILD.humantime-2.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__idna__0_2_0",
        url = "https://crates.io/api/v1/crates/idna/0.2.0/download",
        type = "tar.gz",
        sha256 = "02e2673c30ee86b5b96a9cb52ad15718aa1f966f5ab9ad54a8b95d5ca33120a9",
        strip_prefix = "idna-0.2.0",
        build_file = Label("//consumer/cargo/remote:BUILD.idna-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__instant__0_1_9",
        url = "https://crates.io/api/v1/crates/instant/0.1.9/download",
        type = "tar.gz",
        sha256 = "61124eeebbd69b8190558df225adf7e4caafce0d743919e5d6b19652314ec5ec",
        strip_prefix = "instant-0.1.9",
        build_file = Label("//consumer/cargo/remote:BUILD.instant-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itoa__0_4_6",
        url = "https://crates.io/api/v1/crates/itoa/0.4.6/download",
        type = "tar.gz",
        sha256 = "dc6f3ad7b9d11a0c00842ff8de1b60ee58661048eb8049ed33c73594f359d7e6",
        strip_prefix = "itoa-0.4.6",
        build_file = Label("//consumer/cargo/remote:BUILD.itoa-0.4.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lapin__1_6_1",
        url = "https://crates.io/api/v1/crates/lapin/1.6.1/download",
        type = "tar.gz",
        sha256 = "a04173b1524419f51c00c2f0f0e7b52bb9cd2e5bd9ea030da8bee086bda7e7b2",
        strip_prefix = "lapin-1.6.1",
        build_file = Label("//consumer/cargo/remote:BUILD.lapin-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//consumer/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lexical_core__0_7_4",
        url = "https://crates.io/api/v1/crates/lexical-core/0.7.4/download",
        type = "tar.gz",
        sha256 = "db65c6da02e61f55dae90a0ae427b2a5f6b3e8db09f58d10efab23af92592616",
        strip_prefix = "lexical-core-0.7.4",
        build_file = Label("//consumer/cargo/remote:BUILD.lexical-core-0.7.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_80",
        url = "https://crates.io/api/v1/crates/libc/0.2.80/download",
        type = "tar.gz",
        sha256 = "4d58d1b70b004888f764dfbf6a26a3b0342a1632d33968e4a179d8011c760614",
        strip_prefix = "libc-0.2.80",
        build_file = Label("//consumer/cargo/remote:BUILD.libc-0.2.80.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lock_api__0_4_2",
        url = "https://crates.io/api/v1/crates/lock_api/0.4.2/download",
        type = "tar.gz",
        sha256 = "dd96ffd135b2fd7b973ac026d28085defbe8983df057ced3eb4f2130b0831312",
        strip_prefix = "lock_api-0.4.2",
        build_file = Label("//consumer/cargo/remote:BUILD.lock_api-0.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_11",
        url = "https://crates.io/api/v1/crates/log/0.4.11/download",
        type = "tar.gz",
        sha256 = "4fabed175da42fed1fa0746b0ea71f412aa9d35e76e95e59b192c64b9dc2bf8b",
        strip_prefix = "log-0.4.11",
        build_file = Label("//consumer/cargo/remote:BUILD.log-0.4.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__matches__0_1_8",
        url = "https://crates.io/api/v1/crates/matches/0.1.8/download",
        type = "tar.gz",
        sha256 = "7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08",
        strip_prefix = "matches-0.1.8",
        build_file = Label("//consumer/cargo/remote:BUILD.matches-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__md5__0_7_0",
        url = "https://crates.io/api/v1/crates/md5/0.7.0/download",
        type = "tar.gz",
        sha256 = "490cc448043f947bae3cbee9c203358d62dbee0db12107a74be5c30ccfd09771",
        strip_prefix = "md5-0.7.0",
        build_file = Label("//consumer/cargo/remote:BUILD.md5-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_3_4",
        url = "https://crates.io/api/v1/crates/memchr/2.3.4/download",
        type = "tar.gz",
        sha256 = "0ee1c47aaa256ecabcaea351eae4a9b01ef39ed810004e298d2511ed284b1525",
        strip_prefix = "memchr-2.3.4",
        build_file = Label("//consumer/cargo/remote:BUILD.memchr-2.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mio__0_7_6",
        url = "https://crates.io/api/v1/crates/mio/0.7.6/download",
        type = "tar.gz",
        sha256 = "f33bc887064ef1fd66020c9adfc45bb9f33d75a42096c81e7c56c65b75dd1a8b",
        strip_prefix = "mio-0.7.6",
        build_file = Label("//consumer/cargo/remote:BUILD.mio-0.7.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__miow__0_3_6",
        url = "https://crates.io/api/v1/crates/miow/0.3.6/download",
        type = "tar.gz",
        sha256 = "5a33c1b55807fbed163481b5ba66db4b2fa6cde694a5027be10fb724206c5897",
        strip_prefix = "miow-0.3.6",
        build_file = Label("//consumer/cargo/remote:BUILD.miow-0.3.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__native_tls__0_2_6",
        url = "https://crates.io/api/v1/crates/native-tls/0.2.6/download",
        type = "tar.gz",
        sha256 = "6fcc7939b5edc4e4f86b1b4a04bb1498afaaf871b1a6691838ed06fcb48d3a3f",
        strip_prefix = "native-tls-0.2.6",
        build_file = Label("//consumer/cargo/remote:BUILD.native-tls-0.2.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__nom__6_0_1",
        url = "https://crates.io/api/v1/crates/nom/6.0.1/download",
        type = "tar.gz",
        sha256 = "88034cfd6b4a0d54dd14f4a507eceee36c0b70e5a02236c4e4df571102be17f0",
        strip_prefix = "nom-6.0.1",
        build_file = Label("//consumer/cargo/remote:BUILD.nom-6.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ntapi__0_3_6",
        url = "https://crates.io/api/v1/crates/ntapi/0.3.6/download",
        type = "tar.gz",
        sha256 = "3f6bb902e437b6d86e03cce10a7e2af662292c5dfef23b65899ea3ac9354ad44",
        strip_prefix = "ntapi-0.3.6",
        build_file = Label("//consumer/cargo/remote:BUILD.ntapi-0.3.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__once_cell__1_5_2",
        url = "https://crates.io/api/v1/crates/once_cell/1.5.2/download",
        type = "tar.gz",
        sha256 = "13bd41f508810a131401606d54ac32a467c97172d74ba7662562ebba5ad07fa0",
        strip_prefix = "once_cell-1.5.2",
        build_file = Label("//consumer/cargo/remote:BUILD.once_cell-1.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__opaque_debug__0_3_0",
        url = "https://crates.io/api/v1/crates/opaque-debug/0.3.0/download",
        type = "tar.gz",
        sha256 = "624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6649fc13d5",
        strip_prefix = "opaque-debug-0.3.0",
        build_file = Label("//consumer/cargo/remote:BUILD.opaque-debug-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__openssl__0_10_30",
        url = "https://crates.io/api/v1/crates/openssl/0.10.30/download",
        type = "tar.gz",
        sha256 = "8d575eff3665419f9b83678ff2815858ad9d11567e082f5ac1814baba4e2bcb4",
        strip_prefix = "openssl-0.10.30",
        build_file = Label("//consumer/cargo/remote:BUILD.openssl-0.10.30.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__openssl_probe__0_1_2",
        url = "https://crates.io/api/v1/crates/openssl-probe/0.1.2/download",
        type = "tar.gz",
        sha256 = "77af24da69f9d9341038eba93a073b1fdaaa1b788221b00a69bce9e762cb32de",
        strip_prefix = "openssl-probe-0.1.2",
        build_file = Label("//consumer/cargo/remote:BUILD.openssl-probe-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__openssl_sys__0_9_58",
        url = "https://crates.io/api/v1/crates/openssl-sys/0.9.58/download",
        type = "tar.gz",
        sha256 = "a842db4709b604f0fe5d1170ae3565899be2ad3d9cbc72dedc789ac0511f78de",
        strip_prefix = "openssl-sys-0.9.58",
        build_file = Label("//consumer/cargo/remote:BUILD.openssl-sys-0.9.58.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot__0_11_1",
        url = "https://crates.io/api/v1/crates/parking_lot/0.11.1/download",
        type = "tar.gz",
        sha256 = "6d7744ac029df22dca6284efe4e898991d28e3085c706c972bcd7da4a27a15eb",
        strip_prefix = "parking_lot-0.11.1",
        build_file = Label("//consumer/cargo/remote:BUILD.parking_lot-0.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot_core__0_8_0",
        url = "https://crates.io/api/v1/crates/parking_lot_core/0.8.0/download",
        type = "tar.gz",
        sha256 = "c361aa727dd08437f2f1447be8b59a33b0edd15e0fcee698f935613d9efbca9b",
        strip_prefix = "parking_lot_core-0.8.0",
        build_file = Label("//consumer/cargo/remote:BUILD.parking_lot_core-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pem__0_8_2",
        url = "https://crates.io/api/v1/crates/pem/0.8.2/download",
        type = "tar.gz",
        sha256 = "f4c220d01f863d13d96ca82359d1e81e64a7c6bf0637bcde7b2349630addf0c6",
        strip_prefix = "pem-0.8.2",
        build_file = Label("//consumer/cargo/remote:BUILD.pem-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__percent_encoding__2_1_0",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.1.0/download",
        type = "tar.gz",
        sha256 = "d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e",
        strip_prefix = "percent-encoding-2.1.0",
        build_file = Label("//consumer/cargo/remote:BUILD.percent-encoding-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf__0_8_0",
        url = "https://crates.io/api/v1/crates/phf/0.8.0/download",
        type = "tar.gz",
        sha256 = "3dfb61232e34fcb633f43d12c58f83c1df82962dcdfa565a4e866ffc17dafe12",
        strip_prefix = "phf-0.8.0",
        build_file = Label("//consumer/cargo/remote:BUILD.phf-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf_shared__0_8_0",
        url = "https://crates.io/api/v1/crates/phf_shared/0.8.0/download",
        type = "tar.gz",
        sha256 = "c00cf8b9eafe68dde5e9eaa2cef8ee84a9336a47d566ec55ca16589633b65af7",
        strip_prefix = "phf_shared-0.8.0",
        build_file = Label("//consumer/cargo/remote:BUILD.phf_shared-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project__1_0_2",
        url = "https://crates.io/api/v1/crates/pin-project/1.0.2/download",
        type = "tar.gz",
        sha256 = "9ccc2237c2c489783abd8c4c80e5450fc0e98644555b1364da68cc29aa151ca7",
        strip_prefix = "pin-project-1.0.2",
        build_file = Label("//consumer/cargo/remote:BUILD.pin-project-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_internal__1_0_2",
        url = "https://crates.io/api/v1/crates/pin-project-internal/1.0.2/download",
        type = "tar.gz",
        sha256 = "f8e8d2bf0b23038a4424865103a4df472855692821aab4e4f5c3312d461d9e5f",
        strip_prefix = "pin-project-internal-1.0.2",
        build_file = Label("//consumer/cargo/remote:BUILD.pin-project-internal-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_lite__0_1_11",
        url = "https://crates.io/api/v1/crates/pin-project-lite/0.1.11/download",
        type = "tar.gz",
        sha256 = "c917123afa01924fc84bb20c4c03f004d9c38e5127e3c039bbf7f4b9c76a2f6b",
        strip_prefix = "pin-project-lite-0.1.11",
        build_file = Label("//consumer/cargo/remote:BUILD.pin-project-lite-0.1.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_lite__0_2_0",
        url = "https://crates.io/api/v1/crates/pin-project-lite/0.2.0/download",
        type = "tar.gz",
        sha256 = "6b063f57ec186e6140e2b8b6921e5f1bd89c7356dda5b33acc5401203ca6131c",
        strip_prefix = "pin-project-lite-0.2.0",
        build_file = Label("//consumer/cargo/remote:BUILD.pin-project-lite-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_utils__0_1_0",
        url = "https://crates.io/api/v1/crates/pin-utils/0.1.0/download",
        type = "tar.gz",
        sha256 = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184",
        strip_prefix = "pin-utils-0.1.0",
        build_file = Label("//consumer/cargo/remote:BUILD.pin-utils-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pinky_swear__4_4_0",
        url = "https://crates.io/api/v1/crates/pinky-swear/4.4.0/download",
        type = "tar.gz",
        sha256 = "9bf8cda6f8e1500338634e4e3ce90ac59eb7929a1e088b6946c742be1cc44dc1",
        strip_prefix = "pinky-swear-4.4.0",
        build_file = Label("//consumer/cargo/remote:BUILD.pinky-swear-4.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pkg_config__0_3_19",
        url = "https://crates.io/api/v1/crates/pkg-config/0.3.19/download",
        type = "tar.gz",
        sha256 = "3831453b3449ceb48b6d9c7ad7c96d5ea673e9b470a1dc578c2ce6521230884c",
        strip_prefix = "pkg-config-0.3.19",
        build_file = Label("//consumer/cargo/remote:BUILD.pkg-config-0.3.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__postgres__0_18_1",
        url = "https://crates.io/api/v1/crates/postgres/0.18.1/download",
        type = "tar.gz",
        sha256 = "b25d05de0900dc0254bbad5e4b36b0f750c23ff44fbfcca4c1b9071f7ec1c764",
        strip_prefix = "postgres-0.18.1",
        build_file = Label("//consumer/cargo/remote:BUILD.postgres-0.18.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__postgres_protocol__0_5_3",
        url = "https://crates.io/api/v1/crates/postgres-protocol/0.5.3/download",
        type = "tar.gz",
        sha256 = "4888a0e36637ab38d76cace88c1476937d617ad015f07f6b669cec11beacc019",
        strip_prefix = "postgres-protocol-0.5.3",
        build_file = Label("//consumer/cargo/remote:BUILD.postgres-protocol-0.5.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__postgres_types__0_1_3",
        url = "https://crates.io/api/v1/crates/postgres-types/0.1.3/download",
        type = "tar.gz",
        sha256 = "cfc08a7d94a80665de4a83942fa8db2fdeaf2f123fc0535e384dc4fff251efae",
        strip_prefix = "postgres-types-0.1.3",
        build_file = Label("//consumer/cargo/remote:BUILD.postgres-types-0.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ppv_lite86__0_2_10",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.10/download",
        type = "tar.gz",
        sha256 = "ac74c624d6b2d21f425f752262f42188365d7b8ff1aff74c82e45136510a4857",
        strip_prefix = "ppv-lite86-0.2.10",
        build_file = Label("//consumer/cargo/remote:BUILD.ppv-lite86-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_hack__0_5_19",
        url = "https://crates.io/api/v1/crates/proc-macro-hack/0.5.19/download",
        type = "tar.gz",
        sha256 = "dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5",
        strip_prefix = "proc-macro-hack-0.5.19",
        build_file = Label("//consumer/cargo/remote:BUILD.proc-macro-hack-0.5.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_nested__0_1_6",
        url = "https://crates.io/api/v1/crates/proc-macro-nested/0.1.6/download",
        type = "tar.gz",
        sha256 = "eba180dafb9038b050a4c280019bbedf9f2467b61e5d892dcad585bb57aadc5a",
        strip_prefix = "proc-macro-nested-0.1.6",
        build_file = Label("//consumer/cargo/remote:BUILD.proc-macro-nested-0.1.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_24",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.24/download",
        type = "tar.gz",
        sha256 = "1e0704ee1a7e00d7bb417d0770ea303c1bccbabf0ef1667dae92b5967f5f8a71",
        strip_prefix = "proc-macro2-1.0.24",
        build_file = Label("//consumer/cargo/remote:BUILD.proc-macro2-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_7",
        url = "https://crates.io/api/v1/crates/quote/1.0.7/download",
        type = "tar.gz",
        sha256 = "aa563d17ecb180e500da1cfd2b028310ac758de548efdd203e18f283af693f37",
        strip_prefix = "quote-1.0.7",
        build_file = Label("//consumer/cargo/remote:BUILD.quote-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__radium__0_5_3",
        url = "https://crates.io/api/v1/crates/radium/0.5.3/download",
        type = "tar.gz",
        sha256 = "941ba9d78d8e2f7ce474c015eea4d9c6d25b6a3327f9832ee29a4de27f91bbb8",
        strip_prefix = "radium-0.5.3",
        build_file = Label("//consumer/cargo/remote:BUILD.radium-0.5.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_7_3",
        url = "https://crates.io/api/v1/crates/rand/0.7.3/download",
        type = "tar.gz",
        sha256 = "6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03",
        strip_prefix = "rand-0.7.3",
        build_file = Label("//consumer/cargo/remote:BUILD.rand-0.7.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_chacha__0_2_2",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.2.2/download",
        type = "tar.gz",
        sha256 = "f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402",
        strip_prefix = "rand_chacha-0.2.2",
        build_file = Label("//consumer/cargo/remote:BUILD.rand_chacha-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_5_1",
        url = "https://crates.io/api/v1/crates/rand_core/0.5.1/download",
        type = "tar.gz",
        sha256 = "90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19",
        strip_prefix = "rand_core-0.5.1",
        build_file = Label("//consumer/cargo/remote:BUILD.rand_core-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_hc__0_2_0",
        url = "https://crates.io/api/v1/crates/rand_hc/0.2.0/download",
        type = "tar.gz",
        sha256 = "ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c",
        strip_prefix = "rand_hc-0.2.0",
        build_file = Label("//consumer/cargo/remote:BUILD.rand_hc-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_syscall__0_1_57",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.1.57/download",
        type = "tar.gz",
        sha256 = "41cc0f7e4d5d4544e8861606a285bb08d3e70712ccc7d2b84d7c0ccfaf4b05ce",
        strip_prefix = "redox_syscall-0.1.57",
        build_file = Label("//consumer/cargo/remote:BUILD.redox_syscall-0.1.57.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex__1_4_2",
        url = "https://crates.io/api/v1/crates/regex/1.4.2/download",
        type = "tar.gz",
        sha256 = "38cf2c13ed4745de91a5eb834e11c00bcc3709e773173b2ce4c56c9fbde04b9c",
        strip_prefix = "regex-1.4.2",
        build_file = Label("//consumer/cargo/remote:BUILD.regex-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_syntax__0_6_21",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.21/download",
        type = "tar.gz",
        sha256 = "3b181ba2dcf07aaccad5448e8ead58db5b742cf85dfe035e2227f137a539a189",
        strip_prefix = "regex-syntax-0.6.21",
        build_file = Label("//consumer/cargo/remote:BUILD.regex-syntax-0.6.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__remove_dir_all__0_5_3",
        url = "https://crates.io/api/v1/crates/remove_dir_all/0.5.3/download",
        type = "tar.gz",
        sha256 = "3acd125665422973a33ac9d3dd2df85edad0f4ae9b00dafb1a05e43a9f5ef8e7",
        strip_prefix = "remove_dir_all-0.5.3",
        build_file = Label("//consumer/cargo/remote:BUILD.remove_dir_all-0.5.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ryu__1_0_5",
        url = "https://crates.io/api/v1/crates/ryu/1.0.5/download",
        type = "tar.gz",
        sha256 = "71d301d4193d031abdd79ff7e3dd721168a9572ef3fe51a1517aba235bd8f86e",
        strip_prefix = "ryu-1.0.5",
        build_file = Label("//consumer/cargo/remote:BUILD.ryu-1.0.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__schannel__0_1_19",
        url = "https://crates.io/api/v1/crates/schannel/0.1.19/download",
        type = "tar.gz",
        sha256 = "8f05ba609c234e60bee0d547fe94a4c7e9da733d1c962cf6e59efa4cd9c8bc75",
        strip_prefix = "schannel-0.1.19",
        build_file = Label("//consumer/cargo/remote:BUILD.schannel-0.1.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//consumer/cargo/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__security_framework__2_0_0",
        url = "https://crates.io/api/v1/crates/security-framework/2.0.0/download",
        type = "tar.gz",
        sha256 = "c1759c2e3c8580017a484a7ac56d3abc5a6c1feadf88db2f3633f12ae4268c69",
        strip_prefix = "security-framework-2.0.0",
        build_file = Label("//consumer/cargo/remote:BUILD.security-framework-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__security_framework_sys__2_0_0",
        url = "https://crates.io/api/v1/crates/security-framework-sys/2.0.0/download",
        type = "tar.gz",
        sha256 = "f99b9d5e26d2a71633cc4f2ebae7cc9f874044e0c351a27e17892d76dce5678b",
        strip_prefix = "security-framework-sys-2.0.0",
        build_file = Label("//consumer/cargo/remote:BUILD.security-framework-sys-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_117",
        url = "https://crates.io/api/v1/crates/serde/1.0.117/download",
        type = "tar.gz",
        sha256 = "b88fa983de7720629c9387e9f517353ed404164b1e482c970a90c1a4aaf7dc1a",
        strip_prefix = "serde-1.0.117",
        build_file = Label("//consumer/cargo/remote:BUILD.serde-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_117",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.117/download",
        type = "tar.gz",
        sha256 = "cbd1ae72adb44aab48f325a02444a5fc079349a8d804c1fc922aed3f7454c74e",
        strip_prefix = "serde_derive-1.0.117",
        build_file = Label("//consumer/cargo/remote:BUILD.serde_derive-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_json__1_0_59",
        url = "https://crates.io/api/v1/crates/serde_json/1.0.59/download",
        type = "tar.gz",
        sha256 = "dcac07dbffa1c65e7f816ab9eba78eb142c6d44410f4eeba1e26e4f5dfa56b95",
        strip_prefix = "serde_json-1.0.59",
        build_file = Label("//consumer/cargo/remote:BUILD.serde_json-1.0.59.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sha2__0_9_2",
        url = "https://crates.io/api/v1/crates/sha2/0.9.2/download",
        type = "tar.gz",
        sha256 = "6e7aab86fe2149bad8c507606bdb3f4ef5e7b2380eb92350f56122cca72a42a8",
        strip_prefix = "sha2-0.9.2",
        build_file = Label("//consumer/cargo/remote:BUILD.sha2-0.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__siphasher__0_3_3",
        url = "https://crates.io/api/v1/crates/siphasher/0.3.3/download",
        type = "tar.gz",
        sha256 = "fa8f3741c7372e75519bd9346068370c9cdaabcc1f9599cbcf2a2719352286b7",
        strip_prefix = "siphasher-0.3.3",
        build_file = Label("//consumer/cargo/remote:BUILD.siphasher-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slab__0_4_2",
        url = "https://crates.io/api/v1/crates/slab/0.4.2/download",
        type = "tar.gz",
        sha256 = "c111b5bd5695e56cffe5129854aa230b39c93a305372fdbb2668ca2394eea9f8",
        strip_prefix = "slab-0.4.2",
        build_file = Label("//consumer/cargo/remote:BUILD.slab-0.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_5_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.5.0/download",
        type = "tar.gz",
        sha256 = "7acad6f34eb9e8a259d3283d1e8c1d34d7415943d4895f65cc73813c7396fc85",
        strip_prefix = "smallvec-1.5.0",
        build_file = Label("//consumer/cargo/remote:BUILD.smallvec-1.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__socket2__0_3_17",
        url = "https://crates.io/api/v1/crates/socket2/0.3.17/download",
        type = "tar.gz",
        sha256 = "2c29947abdee2a218277abeca306f25789c938e500ea5a9d4b12a5a504466902",
        strip_prefix = "socket2-0.3.17",
        build_file = Label("//consumer/cargo/remote:BUILD.socket2-0.3.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__static_assertions__1_1_0",
        url = "https://crates.io/api/v1/crates/static_assertions/1.1.0/download",
        type = "tar.gz",
        sha256 = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f",
        strip_prefix = "static_assertions-1.1.0",
        build_file = Label("//consumer/cargo/remote:BUILD.static_assertions-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stringprep__0_1_2",
        url = "https://crates.io/api/v1/crates/stringprep/0.1.2/download",
        type = "tar.gz",
        sha256 = "8ee348cb74b87454fff4b551cbf727025810a004f88aeacae7f85b87f4e9a1c1",
        strip_prefix = "stringprep-0.1.2",
        build_file = Label("//consumer/cargo/remote:BUILD.stringprep-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__subtle__2_3_0",
        url = "https://crates.io/api/v1/crates/subtle/2.3.0/download",
        type = "tar.gz",
        sha256 = "343f3f510c2915908f155e94f17220b19ccfacf2a64a2a5d8004f2c3e311e7fd",
        strip_prefix = "subtle-2.3.0",
        build_file = Label("//consumer/cargo/remote:BUILD.subtle-2.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_53",
        url = "https://crates.io/api/v1/crates/syn/1.0.53/download",
        type = "tar.gz",
        sha256 = "8833e20724c24de12bbaba5ad230ea61c3eafb05b881c7c9d3cfe8638b187e68",
        strip_prefix = "syn-1.0.53",
        build_file = Label("//consumer/cargo/remote:BUILD.syn-1.0.53.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tap__1_0_0",
        url = "https://crates.io/api/v1/crates/tap/1.0.0/download",
        type = "tar.gz",
        sha256 = "36474e732d1affd3a6ed582781b3683df3d0563714c59c39591e8ff707cf078e",
        strip_prefix = "tap-1.0.0",
        build_file = Label("//consumer/cargo/remote:BUILD.tap-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tcp_stream__0_20_6",
        url = "https://crates.io/api/v1/crates/tcp-stream/0.20.6/download",
        type = "tar.gz",
        sha256 = "04c180af0da0f0a75ca080465175892fcdaa750076f125cb953127721e676413",
        strip_prefix = "tcp-stream-0.20.6",
        build_file = Label("//consumer/cargo/remote:BUILD.tcp-stream-0.20.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tempfile__3_1_0",
        url = "https://crates.io/api/v1/crates/tempfile/3.1.0/download",
        type = "tar.gz",
        sha256 = "7a6e24d9338a0a5be79593e2fa15a648add6138caa803e2d5bc782c371732ca9",
        strip_prefix = "tempfile-3.1.0",
        build_file = Label("//consumer/cargo/remote:BUILD.tempfile-3.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__termcolor__1_1_2",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.2/download",
        type = "tar.gz",
        sha256 = "2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e26d88c5f4",
        strip_prefix = "termcolor-1.1.2",
        build_file = Label("//consumer/cargo/remote:BUILD.termcolor-1.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror__1_0_22",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.22/download",
        type = "tar.gz",
        sha256 = "0e9ae34b84616eedaaf1e9dd6026dbe00dcafa92aa0c8077cb69df1fcfe5e53e",
        strip_prefix = "thiserror-1.0.22",
        build_file = Label("//consumer/cargo/remote:BUILD.thiserror-1.0.22.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror_impl__1_0_22",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.22/download",
        type = "tar.gz",
        sha256 = "9ba20f23e85b10754cd195504aebf6a27e2e6cbe28c17778a0c930724628dd56",
        strip_prefix = "thiserror-impl-1.0.22",
        build_file = Label("//consumer/cargo/remote:BUILD.thiserror-impl-1.0.22.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thread_local__1_0_1",
        url = "https://crates.io/api/v1/crates/thread_local/1.0.1/download",
        type = "tar.gz",
        sha256 = "d40c6d1b69745a6ec6fb1ca717914848da4b44ae29d9b3080cbee91d72a69b14",
        strip_prefix = "thread_local-1.0.1",
        build_file = Label("//consumer/cargo/remote:BUILD.thread_local-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinyvec__1_1_0",
        url = "https://crates.io/api/v1/crates/tinyvec/1.1.0/download",
        type = "tar.gz",
        sha256 = "ccf8dbc19eb42fba10e8feaaec282fb50e2c14b2726d6301dbfeed0f73306a6f",
        strip_prefix = "tinyvec-1.1.0",
        build_file = Label("//consumer/cargo/remote:BUILD.tinyvec-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinyvec_macros__0_1_0",
        url = "https://crates.io/api/v1/crates/tinyvec_macros/0.1.0/download",
        type = "tar.gz",
        sha256 = "cda74da7e1a664f795bb1f8a87ec406fb89a02522cf6e50620d016add6dbbf5c",
        strip_prefix = "tinyvec_macros-0.1.0",
        build_file = Label("//consumer/cargo/remote:BUILD.tinyvec_macros-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio__0_3_5",
        url = "https://crates.io/api/v1/crates/tokio/0.3.5/download",
        type = "tar.gz",
        sha256 = "a12a3eb39ee2c231be64487f1fcbe726c8f2514876a55480a5ab8559fc374252",
        strip_prefix = "tokio-0.3.5",
        build_file = Label("//consumer/cargo/remote:BUILD.tokio-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio_postgres__0_6_0",
        url = "https://crates.io/api/v1/crates/tokio-postgres/0.6.0/download",
        type = "tar.gz",
        sha256 = "150d9be163b0df6dc185b8ee33bcb9a74865f0cad754495847f2e06e2051a345",
        strip_prefix = "tokio-postgres-0.6.0",
        build_file = Label("//consumer/cargo/remote:BUILD.tokio-postgres-0.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio_util__0_4_0",
        url = "https://crates.io/api/v1/crates/tokio-util/0.4.0/download",
        type = "tar.gz",
        sha256 = "24793699f4665ba0416ed287dc794fe6b11a4aa5e4e95b58624f45f6c46b97d4",
        strip_prefix = "tokio-util-0.4.0",
        build_file = Label("//consumer/cargo/remote:BUILD.tokio-util-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing__0_1_22",
        url = "https://crates.io/api/v1/crates/tracing/0.1.22/download",
        type = "tar.gz",
        sha256 = "9f47026cdc4080c07e49b37087de021820269d996f581aac150ef9e5583eefe3",
        strip_prefix = "tracing-0.1.22",
        build_file = Label("//consumer/cargo/remote:BUILD.tracing-0.1.22.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing_core__0_1_17",
        url = "https://crates.io/api/v1/crates/tracing-core/0.1.17/download",
        type = "tar.gz",
        sha256 = "f50de3927f93d202783f4513cda820ab47ef17f624b03c096e86ef00c67e6b5f",
        strip_prefix = "tracing-core-0.1.17",
        build_file = Label("//consumer/cargo/remote:BUILD.tracing-core-0.1.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typenum__1_12_0",
        url = "https://crates.io/api/v1/crates/typenum/1.12.0/download",
        type = "tar.gz",
        sha256 = "373c8a200f9e67a0c95e62a4f52fbf80c23b4381c05a17845531982fa99e6b33",
        strip_prefix = "typenum-1.12.0",
        build_file = Label("//consumer/cargo/remote:BUILD.typenum-1.12.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_bidi__0_3_4",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.4/download",
        type = "tar.gz",
        sha256 = "49f2bd0c6468a8230e1db229cff8029217cf623c767ea5d60bfbd42729ea54d5",
        strip_prefix = "unicode-bidi-0.3.4",
        build_file = Label("//consumer/cargo/remote:BUILD.unicode-bidi-0.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_normalization__0_1_16",
        url = "https://crates.io/api/v1/crates/unicode-normalization/0.1.16/download",
        type = "tar.gz",
        sha256 = "a13e63ab62dbe32aeee58d1c5408d35c36c392bba5d9d3142287219721afe606",
        strip_prefix = "unicode-normalization-0.1.16",
        build_file = Label("//consumer/cargo/remote:BUILD.unicode-normalization-0.1.16.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_2_1",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.1/download",
        type = "tar.gz",
        sha256 = "f7fe0bb3479651439c9112f72b6c505038574c9fbb575ed1bf3b797fa39dd564",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//consumer/cargo/remote:BUILD.unicode-xid-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__url__2_2_0",
        url = "https://crates.io/api/v1/crates/url/2.2.0/download",
        type = "tar.gz",
        sha256 = "5909f2b0817350449ed73e8bcd81c8c3c8d9a7a5d8acba4b27db277f1868976e",
        strip_prefix = "url-2.2.0",
        build_file = Label("//consumer/cargo/remote:BUILD.url-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__vcpkg__0_2_10",
        url = "https://crates.io/api/v1/crates/vcpkg/0.2.10/download",
        type = "tar.gz",
        sha256 = "6454029bf181f092ad1b853286f23e2c507d8e8194d01d92da4a55c274a5508c",
        strip_prefix = "vcpkg-0.2.10",
        build_file = Label("//consumer/cargo/remote:BUILD.vcpkg-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__version_check__0_9_2",
        url = "https://crates.io/api/v1/crates/version_check/0.9.2/download",
        type = "tar.gz",
        sha256 = "b5a972e5669d67ba988ce3dc826706fb0a8b01471c088cb0b6110b805cc36aed",
        strip_prefix = "version_check-0.9.2",
        build_file = Label("//consumer/cargo/remote:BUILD.version_check-0.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.9.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",
        build_file = Label("//consumer/cargo/remote:BUILD.wasi-0.9.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//consumer/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//consumer/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//consumer/cargo/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//consumer/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wyz__0_2_0",
        url = "https://crates.io/api/v1/crates/wyz/0.2.0/download",
        type = "tar.gz",
        sha256 = "85e60b0d1b5f99db2556934e21937020776a5d31520bf169e851ac44e6420214",
        strip_prefix = "wyz-0.2.0",
        build_file = Label("//consumer/cargo/remote:BUILD.wyz-0.2.0.bazel"),
    )

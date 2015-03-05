# GitLab EE Omnibus packages

Below are the [gitlab-omnibus packages](https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/README.md) for GitLab Enterprise Edition.

Installation instructions are similar to the [CE Omnibus package instructions](https://about.gitlab.com/downloads/) after choosing an OS (of course your package name is different).
[Update instructions](https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/update.md) can be found in the GitLab Omnibus documentation.
The [GitLab Omnibus Readme](https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/README.md) contains troubleshooting information and configuration options.

Please contact <subscribers@gitlab.com> if you have any questions.

## RPM 'package is already installed' error

If you are using RPM and you are upgrading from GitLab Community Edition you may get an error like this:

```
package gitlab-7.6.3_omnibus.5.3.0.ci-1.el7.x86_64 (which is newer than gitlab-7.5.3_ee.omnibus.5.2.1.ci-1.el7.x86_64) is already installed
```

You can override this version check with the `--oldpackage` option:

```
rpm -Uvh --oldpackage gitlab-7.5.3_ee.omnibus.5.2.1.ci-1.el7.x86_64.rpm
```

### GitLab 7.8.2 Enterprise Edition and 7.8.2 GitLab CI

- Ubuntu 14.04 64-bit [gitlab_7.8.2-ee.omnibus.1-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/d5f84196a61c7942361baf5a77d46c3b4aaf600e/ubuntu-14.04/gitlab_7.8.2-ee.omnibus.1-1_amd64.deb)
+ SHA256: b5436981ced393a3d1f083564d6f8b1d6a038cd6379f002e6a63168a5cd7ac9f

- Ubuntu 12.04 64-bit [gitlab_7.8.2-ee.omnibus.1-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/1e579249566eab2982a32ec4c85054ebdcf88ca8/ubuntu-12.04/gitlab_7.8.2-ee.omnibus.1-1_amd64.deb)
+ SHA256: 671ee6744e7e864fbe40c06fd3e3c151d016befbc1a8ff307027be6ac7b12133

- Debian 7 64-bit [gitlab_7.8.2-ee.omnibus.1-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/e5ab96681c96fc7df9fdb4bb1b1874234b7a6939/debian-7.8/gitlab_7.8.2-ee.omnibus.1-1_amd64.deb)
+ SHA256: b8a4d3983819a1e99d98c74e56132f92223a4a44c098a0c5e965ac643ac67f00

- CentOS 6 64-bit [gitlab-7.8.2_ee.omnibus.1-1.el6.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/48b0b465f84395aec65c15cc8922a49733562e52/centos-6.6/gitlab-7.8.2_ee.omnibus.1-1.el6.x86_64.rpm)
+ SHA256: 386c9fa5f598529ed8a89a5218a8e345a9f7d43a7f5d3fd5d6f8deaa6c8ec7ea

- CentOS 7 64-bit [gitlab-7.8.2_ee.omnibus.1-1.el7.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/7bab4e5ceb00def4bec4654dc9a91b48bc29e21d/centos-7.0.1406/gitlab-7.8.2_ee.omnibus.1-1.el7.x86_64.rpm)
+ SHA256: da7e4ebba0af25d70ce14e55993ed54312a5848594b4a0ace1c6f1ce2cfb99d7

### GitLab 7.8.1 Enterprise Edition and 7.8.1 GitLab CI

- Ubuntu 14.04 64-bit [gitlab_7.8.1-ee.omnibus-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/5f049ad97677b369ac4f0835026a555429dca496/ubuntu-14.04/gitlab_7.8.1-ee.omnibus-1_amd64.deb)
+ SHA256: 8fdb008ae2c60940960ace3ec005623801759fac5c17c4dd8978e3441726a091

- Ubuntu 12.04 64-bit [gitlab_7.8.1-ee.omnibus-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/528e72dd6f4b59d2119fc7a49d39d473f73a469c/ubuntu-12.04/gitlab_7.8.1-ee.omnibus-1_amd64.deb)
+ SHA256: f26adf014f223dea05057455317fa4d60626ecc6717dd3e7f7c9bd54f70786fa

- Debian 7 64-bit [gitlab_7.8.1-ee.omnibus-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/2b66f834cad45831628263c1ddc064abaa29af5c/debian-7.8/gitlab_7.8.1-ee.omnibus-1_amd64.deb)
+ SHA256: 2c2d5e1a49ece4f89ebe9e6d53afb9836ee999df08f8409017a40988112795f0

- CentOS 6 64-bit [gitlab-7.8.1_ee.omnibus-1.el6.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/29e959fdafbe3bbd02c5334caf1d0300939f7b00/centos-6.6/gitlab-7.8.1_ee.omnibus-1.el6.x86_64.rpm)
+ SHA256: 6849962f6b1ef2dd04a4a6068fbba7a1da9cabea37a6add5466c9e4ae4c87dcc

- CentOS 7 64-bit [gitlab-7.8.1_ee.omnibus-1.el7.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/a028e73e557ebacd3037fc7ef19125af9538b10c/centos-7.0.1406/gitlab-7.8.1_ee.omnibus-1.el7.x86_64.rpm)
+ SHA256: 6b5ef580943fb56565569d81e4eb6e379cddebff4ff98e7b5920e31cfad67dc9

### GitLab 7.8.0 Enterprise Edition and 7.8.0 GitLab CI

- Ubuntu 14.04 64-bit [gitlab_7.8.0-ee.omnibus-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/c23c15a79d1adcf611869f5780ba8322336a28ea/ubuntu-14.04/gitlab_7.8.0-ee.omnibus-1_amd64.deb)
+ SHA256: 9f76caccd3bef8ad77778230f12cb1285cda97cf9ea744809e22e810c9112b18

- Ubuntu 12.04 64-bit [gitlab_7.8.0-ee.omnibus-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/bc029055f3e5b401d155f714494cb7c0893fa4bb/ubuntu-12.04/gitlab_7.8.0-ee.omnibus-1_amd64.deb)
+ SHA256: 8af55bfab7e82b509d0923de2a5f755bbf725fe8b7a823f6f5f18a5dddd3755e

- Debian 7 64-bit [gitlab_7.8.0-ee.omnibus-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/af97f9d2ea2aca241817adf384028e80a4dbfb86/debian-7.8/gitlab_7.8.0-ee.omnibus-1_amd64.deb)
+ SHA256: b66789f80d9e61cb6433683d502772738fda38b8ea5fdde2767295b776602f87

- CentOS 6 64-bit [gitlab-7.8.0_ee.omnibus-1.el6.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/50bba46a386dc9d3b2468676d0fc256e2c5ff4f5/centos-6.6/gitlab-7.8.0_ee.omnibus-1.el6.x86_64.rpm)
+ SHA256: 5cc0ea333e39ae68bb19325dc394288bd874d02f5486e29c2f6257576c679634

- CentOS 7 64-bit [gitlab-7.8.0_ee.omnibus-1.el7.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/c32491e9a1886d5a2a0220080c7ac05781fb028e/centos-7.0.1406/gitlab-7.8.0_ee.omnibus-1.el7.x86_64.rpm)
+ SHA256: baef317b9797547ac939b9dc2574a6687e802da63e1d99c52fcb36fe83fe46dc

### GitLab 7.7.2 Enterprise Edition

- 7.7.2-ee/CI 5.4.2 - Ubuntu 14.04 64-bit [gitlab_7.7.2-ee.omnibus.5.4.2.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/92a6fc5791e0b57e85262026f40e35bc301b7589/ubuntu-14.04/gitlab_7.7.2-ee.omnibus.5.4.2.ci-1_amd64.deb)
+ SHA256: e6dc36302ca76ffa71db35286f6609331f15317a076397f34b2db9a40781a74f

- 7.7.2-ee/CI 5.4.2 - Ubuntu 12.04 64-bit [gitlab_7.7.2-ee.omnibus.5.4.2.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/30b232210a9b8a1ecaeec5452bb6f62e294e1f12/ubuntu-12.04/gitlab_7.7.2-ee.omnibus.5.4.2.ci-1_amd64.deb)
+ SHA256: d8806c786811ea3fcfeb4c57003eec28f9e1b7de32f88bfeb1931206641f090a

- 7.7.2-ee/CI 5.4.2 - Debian 7 64-bit [gitlab_7.7.2-ee.omnibus.5.4.2.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/6b2b59ef1f1e38d99b1f6141b7d8191839bc699c/debian-7.8/gitlab_7.7.2-ee.omnibus.5.4.2.ci-1_amd64.deb)
+ SHA256: 735654628b8422f773ca507a994e44c07e97e031528de5387f042bb045dbcfaa

- 7.7.2-ee/CI 5.4.2 - CentOS 6 64-bit [gitlab-7.7.2_ee.omnibus.5.4.2.ci-1.el6.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/2f54053ca9a30d580fe3938d6bd60049f26fffa1/centos-6.6/gitlab-7.7.2_ee.omnibus.5.4.2.ci-1.el6.x86_64.rpm)
+ SHA256: 4c2b65b4a5961ed92b32654393673013fce68e320008e8f1b3c5378d65584671

- 7.7.2-ee/CI 5.4.2 - CentOS 7 64-bit [gitlab-7.7.2_ee.omnibus.5.4.2.ci-1.el7.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/ef7f1607189faa4e872ed5eaef5138eb69f1cef0/centos-7.0.1406/gitlab-7.7.2_ee.omnibus.5.4.2.ci-1.el7.x86_64.rpm)
+ SHA256: 7ee58812bd99439bcec6ac0b206fbb393e8a3574fc59d79d770b88d2688cc924

### GitLab 7.7.1 Enterprise Edition

- 7.7.1-ee/CI 5.4.1 - Ubuntu 14.04 64-bit [gitlab_7.7.1-ee.omnibus.5.4.1.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/ee9abb477702cbbf5e50b25e686fc84973b06870/ubuntu-14.04/gitlab_7.7.1-ee.omnibus.5.4.1.ci-1_amd64.deb)
+ SHA256: 6fa0dde4b094d413dae8e456e6f1558adfa6af893cab65738a9c585055f7e545

- 7.7.1-ee/CI 5.4.1 - Ubuntu 12.04 64-bit [gitlab_7.7.1-ee.omnibus.5.4.1.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/09003d0756397f92f6bbfb804f97c074ad59a39d/ubuntu-12.04/gitlab_7.7.1-ee.omnibus.5.4.1.ci-1_amd64.deb)
+ SHA256: d316f96f7da046f20b43a37309a3aaa595f874afa348b5e64afea48a005d0dec

- 7.7.1-ee/CI 5.4.1 - Debian 7 64-bit [gitlab_7.7.1-ee.omnibus.5.4.1.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/6715b78ef9779c9b2514947d516b5d48e9cabb69/debian-7.6/gitlab_7.7.1-ee.omnibus.5.4.1.ci-1_amd64.deb)
+ SHA256: 735654628b8422f773ca507a994e44c07e97e031528de5387f042bb045dbcfaa

- 7.7.1-ee/CI 5.4.1 - CentOS 6 64-bit [gitlab-7.7.1_ee.omnibus.5.4.1.ci-1.el6.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/21d822a37d84e5e94d23380cdc805366f999ea67/centos-6.6/gitlab-7.7.1_ee.omnibus.5.4.1.ci-1.el6.x86_64.rpm)
+ SHA256: 2d8e9e00d3739d3ba30cc624f80712098febcfdaed96c3c553d18e5d78133d74

- 7.7.1-ee/CI 5.4.1 - CentOS 7 64-bit [gitlab-7.7.1_ee.omnibus.5.4.1.ci-1.el7.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/21e1cb2e2a2169349afe317ad324a5832ad48193/centos-7.0.1406/gitlab-7.7.1_ee.omnibus.5.4.1.ci-1.el7.x86_64.rpm)
+ SHA256: 81394fddf5ec74fd649796deb2331c84de9483d346d8940a28a16f53e75f351c

### GitLab 7.7.0 Enterprise Edition

- 7.7.0-ee/CI 5.4.0 - Ubuntu 14.04 64-bit [gitlab_7.7.0-ee.omnibus.5.4.0.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/413ccbedb48feea5c6f69d900c2d48053b5ad15f/ubuntu-14.04/gitlab_7.7.0-ee.omnibus.5.4.0.ci-1_amd64.deb)
+ SHA256: 86dbf7292a0a0b463e8becf9e31699d3ef9f9d410a6a0d7d56eb4b65d79b5f8f

- 7.7.0-ee/CI 5.4.0 - Ubuntu 12.04 64-bit [gitlab_7.7.0-ee.omnibus.5.4.0.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/3e584bca1f7a8ee71f0ba643a05572d82868479a/ubuntu-12.04/gitlab_7.7.0-ee.omnibus.5.4.0.ci-1_amd64.deb)
+ SHA256: 68789e73259d2d611ad3e992bfe69764d5b2828c9269dcc562b3e73b52812b9d

- 7.7.0-ee/CI 5.4.0 - Debian 7 64-bit [gitlab_7.7.0-ee.omnibus.5.4.0.ci-1_amd64.deb](https://downloads-packages.s3.amazonaws.com/80301e4c8d660671fbd299cd6570f5c218ee8d3c/debian-7.6/gitlab_7.7.0-ee.omnibus.5.4.0.ci-1_amd64.deb)
+ SHA256: 9bc9594f34214e00c59da170965a9b6fb5ff13872dcb3bb1828adadcc07150dc

- 7.7.0-ee/CI 5.4.0 - CentOS 6 64-bit [gitlab-7.7.0_ee.omnibus.5.4.0.ci-1.el6.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/5f167cfd206dfd2531d05596bb16182d440f9dac/centos-6.6/gitlab-7.7.0_ee.omnibus.5.4.0.ci-1.el6.x86_64.rpm)
+ SHA256: 781c81a8cdd73964d10d2a6bb4f16718f30b438937dfefa9b698ec4694a8acf5

- 7.7.0-ee/CI 5.4.0 - CentOS 7 64-bit [gitlab-7.7.0_ee.omnibus.5.4.0.ci-1.el7.x86_64.rpm](https://downloads-packages.s3.amazonaws.com/7e0451d53bdfc075cb9cb5b528bf1af27e65a684/centos-7.0.1406/gitlab-7.7.0_ee.omnibus.5.4.0.ci-1.el7.x86_64.rpm)
+ SHA256: d305e44874067f88e91d1ca87cef572196ed540d2fe0aecbbb68d15051f045bd

### GitLab 7.6.3 Enterprise Edition

- Ubuntu 14.04 64-bit - 7.6.3-ee/CI 5.3.0 [gitlab_7.6.3-ee.omnibus.5.3.0.ci.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/c6a3515ca1bafff7fbb28f4f0eb4923fea45c230/ubuntu-14.04/gitlab_7.6.3-ee.omnibus.5.3.0.ci.1-1_amd64.deb)
+ SHA256: 8b038ac879653a3187f5bd282b455afc0054bf6d486835bb334631295a286ffb

-  Ubuntu 12.04 64-bit - 7.6.3-ee/CI 5.3.0 [gitlab_7.6.3-ee.omnibus.5.3.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/8d3dc83883a7cb777ab576750c189dd90ba392f6/ubuntu-12.04/gitlab_7.6.3-ee.omnibus.5.3.0.ci.1-1_amd64.deb)
+ SHA256: ab761a0b650b62d21ad0e9a29955907a5f9efcc108b0af115e8846d713760f11

- Debian 7 64-bit - 7.6.3-ee/CI 5.3.0 [gitlab_7.6.3-ee.omnibus.5.3.0.ci.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/d87605a1df241e695bdd9b4cb8591838096a8427/debian-7.7/gitlab_7.6.3-ee.omnibus.5.3.0.ci.1-1_amd64.deb)
+ SHA256: c05aac681e578d3c65d0fbfc7911c5af2abdb88fd7162f50bb8b33b953e2c580

- CentOS 6 64-bit - 7.6.3-ee/CI 5.3.0 [gitlab-7.6.3_ee.omnibus.5.3.0.ci.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/99cf1d877e29773427a096abb5fcb78edac73b02/centos-6.6/gitlab-7.6.3_ee.omnibus.5.3.0.ci.1-1.el6.x86_64.rpm)
+ SHA256: cb2a675b26eebca43a74c34c656fba8c71b4fe21360f38245c9bd6d3c7a0d4bc

- CentOS 7 64-bit - 7.6.3-ee/CI 5.3.0 [gitlab-7.6.3_ee.omnibus.5.3.0.ci.1-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/47d608b352338f5b878a38ddc1eb88e049b7a051/centos-7.0.1406/gitlab-7.6.3_ee.omnibus.5.3.0.ci.1-1.el7.x86_64.rpm)
+ SHA256: 0d22124a7cba2d5b9a7fb3bfa288a9d267e574f53ada27999f5dfdfe870278ed


### GitLab 7.6.2 Enterprise Edition

- 7.6.2-ee/CI 5.3.0 - Ubuntu 14.04 64-bit [gitlab_7.6.2-ee.omnibus.5.3.0.ci.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/44449a1cd473eb3f6f79dd88e57d5b8254c4a16d/ubuntu-14.04/gitlab_7.6.2-ee.omnibus.5.3.0.ci.1-1_amd64.deb)
+ SHA256: 3254c613e356b58b040aa2695af78f036dde83d05150ccae1d3021e223709210

- 7.6.2-ee/CI 5.3.0 - Ubuntu 12.04 64-bit [gitlab_7.6.2-ee.omnibus.5.3.0.ci.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/4dffcf1fe07b5825f9c94c9efc02c675757057e3/ubuntu-12.04/gitlab_7.6.2-ee.omnibus.5.3.0.ci.1-1_amd64.deb)
+ SHA256: 92af46677254b58ec33a333eb6c2915fd80724165b4b732e1660ee3b129c7c8d

- 7.6.2-ee/CI 5.3.0 - Debian 7 64-bit [gitlab_7.6.2-ee.omnibus.5.3.0.ci.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/1b7f1f2e0726908205abfffee87315c3a40e1e08/debian-7.7/gitlab_7.6.2-ee.omnibus.5.3.0.ci.1-1_amd64.deb)
+ SHA256: 4fd62c0ce1db6bd5bdce8b64e236cb8f7d2bc251a20f853a9bf3a407858748af

- 7.6.2-ee/CI 5.3.0 - CentOS 6 64-bit [gitlab-7.6.2_ee.omnibus.5.3.0.ci.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/455b87ddd5459b8bdbd86cdabdb5e1c6783c3592/centos-6.6/gitlab-7.6.2_ee.omnibus.5.3.0.ci.1-1.el6.x86_64.rpm)
+ SHA256: 64110aaad20ba52f81dd5011bfadb960b6e1047bb2aaa8c8e39dd0d5a1475efc

- 7.6.2-ee/CI 5.3.0 - CentOS 7 64-bit [gitlab-7.6.2_ee.omnibus.5.3.0.ci.1-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/8f9278f7796b060acc0a116b6bc424cbcfd64698/centos-7.0.1406/gitlab-7.6.2_ee.omnibus.5.3.0.ci.1-1.el7.x86_64.rpm)
+ SHA256: 073385056fd0659c4f15ffd368b8b9e9f2b80a3fb211adfd06203811de082bf4


### GitLab 7.6.0 Enterprise Edition

- 7.6.0-ee/CI 5.3.0 - Ubuntu 14.04 64-bit [gitlab_7.6.0-ee.omnibus.5.3.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/fadbb1570f35a76e8b57435bb9f3bfc321b59956/ubuntu-14.04/gitlab_7.6.0-ee.omnibus.5.3.0.ci-1_amd64.deb)
    + SHA256: 72e961070688763391aafd28a94ca893b74a2f612b64f9e2d5c7aa3b972ee6ed

- 7.6.0-ee/CI 5.3.0 - Ubuntu 12.04 64-bit [gitlab_7.6.0-ee.omnibus.5.3.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/0af6270fbc92e3fc2ff621547187b852f2a0be7a/ubuntu-12.04/gitlab_7.6.0-ee.omnibus.5.3.0.ci-1_amd64.deb)
    + SHA256: 306205a5f4ebab40f423f02957d0ca1a6a899d50aaabfceac121e76bfba2e775

- 7.6.0-ee/CI 5.3.0 - Debian 7 64-bit [gitlab_7.6.0-ee.omnibus.5.3.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/5d7f757633a09bb172c5e55b0a7efc7a729927e1/debian-7.7/gitlab_7.6.0-ee.omnibus.5.3.0.ci-1_amd64.deb)
    + SHA256: 2da8df98000ea4e217e08533911f28ade2c278f8c5d7717f7a8bc9911c810530

- 7.6.0-ee/CI 5.3.0 - CentOS 6 64-bit [gitlab-7.6.0_ee.omnibus.5.3.0.ci-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/9ff0148bbf7b3f327c05ce0e4b5fdc938eb1bd7c/centos-6.6/gitlab-7.6.0_ee.omnibus.5.3.0.ci-1.el6.x86_64.rpm)
    + SHA256: fcc92c8b3723217dcad8677cea3d2f2b54cade6c235668a0bc2b11773fd3c052

#### Note: GitLab 7.6 EE for Centos 7 will be released later today

- 7.5.3-ee/CI 5.2.1 - CentOS 7 64-bit [gitlab-7.5.3_ee.omnibus.5.2.1.ci-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/f08d577a156a0bf4ef06f4b42586a94707d2e456/centos-7.0.1406/gitlab-7.5.3_ee.omnibus.5.2.1.ci-1.el7.x86_64.rpm)
    + SHA256: d3e734f37841b38f37892ea5557a7c707f0e7bba8bf5f70869f309bd8f21120a


## Previous versions

### Ubuntu 14.04 64-bit

- 7.5.3-ee/CI 5.2.1 - Ubuntu 14.04 64-bit [gitlab_7.5.3-ee.omnibus.5.2.1.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/05998bb8ba9cca0ef22c90f4529c875003c51f23/ubuntu-14.04/gitlab_7.5.3-ee.omnibus.5.2.1.ci-1_amd64.deb)
    + SHA256: 5aa2e0c7ff9b48344d2d5bf62dd4fbff09ccd95c010331e12da78e2cd73cf430

- 7.5.2-ee/CI 5.2.1 - Ubuntu 14.04 64-bit [gitlab_7.5.2-ee.omnibus.5.2.1.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/e864efcad31bc4ede2c1e1fc8bba8951e4468e5f/ubuntu-14.04/gitlab_7.5.2-ee.omnibus.5.2.1.ci-1_amd64.deb)
    + SHA256: 70e04525b4c55eb55567f2c45b09a2ce31a1d5a59296947d86706656e79f8ae3

- 7.5.1-ee/CI 5.2.0 - Ubuntu 14.04 64-bit [gitlab_7.5.1-ee.omnibus.5.2.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/3da7e4fb16f1a15de137a5ac5d4cb4a39cef536c/ubuntu-14.04/gitlab_7.5.1-ee.omnibus.5.2.0.ci-1_amd64.deb)
    + SHA256: 834e9478e7dd6862cd9ce61c7179eb765b66d7ebe61c493ffd44e15b79f287b8

- 7.4.5-ee/CI 5.1.0 - Ubuntu 14.04 64-bit [gitlab_7.4.5-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/9ac1901f0e346f5c795262368450fda9b1f7bbb9/ubuntu-14.04/gitlab_7.4.5-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + SHA256: 8e44f7cc87a73f007c882f5f9147294073a7ea58a805d9a3cb43d1ed1e0d9dfe

- 7.4.4-ee/CI 5.1.0 - Ubuntu 14.04 64-bit [gitlab_7.4.4-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/2a880962cd18293a9da61ab884c29cbdd7eebdba/ubuntu-14.04/gitlab_7.4.4-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + MD5: d549fdaa96e53a2a98cb91676076259a

- 7.4.3-ee/CI 5.1.0 - Ubuntu 14.04 64-bit [gitlab_7.4.3-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/fca7e66f323d8fbffbd86fbb26a6f60eab891dc9/ubuntu-14.04/gitlab_7.4.3-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + MD5: 7bd15c589f9fb81750c5fc77d3f9881f

- 7.4.3-ee - Ubuntu 14.04 64-bit [gitlab_7.4.3-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/7ebaadae0ea2ca05971a80e5000877943bb1fbfc/ubuntu-14.04/gitlab_7.4.3-ee.omnibus.1-1_amd64.deb)
    + MD5: 639e9519a9cd0629685ac16db8d68b5c

- 7.4.2-ee - Ubuntu 14.04 64-bit [gitlab_7.4.2-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/e38dad05abb276453da95d78fa1eaa41d783f390/ubuntu-14.04/gitlab_7.4.2-ee.omnibus-1_amd64.deb)
    + MD5: 7a28adaf0fc96e86fafe4a363484fe07

- 7.4.1-ee - Ubuntu 14.04 64-bit [gitlab_7.4.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/d6e0332c065645b2ac380890f8406224377cbcfc/ubuntu-14.04/gitlab_7.4.1-ee.omnibus-1_amd64.deb)
    + MD5: aa39962db5c6e9b5f56a6c592927d338

- 7.4.0-ee - Ubuntu 14.04 64-bit [gitlab_7.4.0-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/7839c59170801447b308694628378151a988ce75/ubuntu-14.04/gitlab_7.4.0-ee.omnibus.2-1_amd64.deb)
    + MD5: e091774fdd2649f3a839bef1c608399f

- 7.3.2-ee - Ubuntu 14.04 64-bit [gitlab_7.3.2-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/b4d37ee804679cdd21b3cf5c83c43ca0f40ae2a6/ubuntu-14.04/gitlab_7.3.2-ee.omnibus-1_amd64.deb)
    + MD5: 53539f5f7833a760a9918633ca8c9be5

- 7.3.1-ee - Ubuntu 14.04 64-bit [gitlab_7.3.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/50d2c5178c423a141f316f52e3447aefc017c77b/ubuntu-14.04/gitlab_7.3.1-ee.omnibus-1_amd64.deb)
    + MD5: e4342b4a4d7192f8f7eb04816eba6c29

- 7.3.0-ee - Ubuntu 14.04 64-bit [gitlab_7.3.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/bb2502342d24cc9ffd773946f7f3027be60cf612/ubuntu-14.04/gitlab_7.3.0-ee.omnibus-1_amd64.deb)
    + MD5: 6d46e3ec4051fe2fa616baf6bdf7d594

- 7.2.2-ee - Ubuntu 14.04 64-bit [gitlab_7.2.2-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/e542352a629ad69f12d29476c85f6abb27202136/ubuntu-14.04/gitlab_7.2.2-ee.omnibus-1_amd64.deb)
    + MD5: 1612bc8b722e9e01d27845f0e1102758

- 7.2.1-ee - Ubuntu 14.04 64-bit [gitlab_7.2.1-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/b88dc7319205954b71fe53e15e0cee5211e399d3/ubuntu-14.04/gitlab_7.2.1-ee.omnibus.2-1_amd64.deb)
    + MD5: 22b3120d14b29495741a6c04dbc88f7d

- 7.2.0-ee - Ubuntu 14.04 64-bit [gitlab_7.2.0-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/f8bfb6cafa08687822786ff5be822c8b36a656f5/ubuntu-14.04/gitlab_7.2.0-ee.omnibus.2-1_amd64.deb)
    + MD5: 356263bdfe56c9bed04096c40ca3a8a2

- 7.1.1-ee - Ubuntu 14.04 64-bit [gitlab_7.1.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/fe636f5b18be2a47198278337547124405e05051/ubuntu-14.04/gitlab_7.1.1-ee.omnibus-1_amd64.deb)
    + MD5: 4b005d4f7e92538663e993f97e9f94be

- 7.1.0-ee - Ubuntu 14.04 64-bit [gitlab_7.1.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/2b86ee72a2b5f469a453d4dcb2e7a54dd6d1945d/ubuntu-14.04/gitlab_7.1.0-ee.omnibus-1_amd64.deb)
    + MD5: 46372eb1f620985d199b7c364d211625

- 7.0.1-ee - Ubuntu 14.04 64-bit [gitlab_7.0.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/0c687476e83a80fa4fa717ad5881f41e31a41eb0/ubuntu-14.04/gitlab_7.0.1-ee.omnibus-1_amd64.deb)
    + MD5: 547d15f7a6bb05ce0b3b0776c99eb40c

- 7.0.0-ee - Ubuntu 14.04 64-bit [gitlab_7.0.0-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/7e416d0421a055dc87c471d9be981c8959615406/ubuntu-14.04/gitlab_7.0.0-ee.omnibus.1-1_amd64.deb)
    - MD5: 0a0a821a166dc08499359a72daf2aa88

### Ubuntu 12.04 64-bit

- 7.5.3-ee/CI 5.2.1 - Ubuntu 12.04 64-bit [gitlab_7.5.3-ee.omnibus.5.2.1.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/b8b21efced5fb783a8fdb67f6e62abe9b4a355f5/ubuntu-12.04/gitlab_7.5.3-ee.omnibus.5.2.1.ci-1_amd64.deb)
    + SHA256: a502347f3cde250e875dd378d83dd180ecaf02adb997c89401209b779b8f3764

- 7.5.2-ee/CI 5.2.1 - Ubuntu 12.04 64-bit [gitlab_7.5.2-ee.omnibus.5.2.1.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/3d414be81496a7c8e7ca5643a23d49787055241e/ubuntu-12.04/gitlab_7.5.2-ee.omnibus.5.2.1.ci-1_amd64.deb)
    + SHA256: abc84afdcfae11325944c037e9b070d6fd63e630d8a64627316aa056a2f1dfaa

- 7.5.1-ee/CI 5.2.0 - Ubuntu 12.04 64-bit [gitlab_7.5.1-ee.omnibus.5.2.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/d657214f75cfafb1e6e47f179fca394fd8c3c34e/ubuntu-12.04/gitlab_7.5.1-ee.omnibus.5.2.0.ci-1_amd64.deb)
    + SHA256: 843e177375f8d2f2b149405dfbd65f023952938cf017d4f8946b7badf98220a2

- 7.4.5-ee/CI 5.1.0 - Ubuntu 12.04 64-bit [gitlab_7.4.5-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/16e535efc9f100d6acafa651e28180c6573197f3/ubuntu-12.04/gitlab_7.4.5-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + SHA256: 92fa8eb59efc6ae901a13ad47712061edd468d111e197517a7d96309a6798152

- 7.4.4-ee/CI 5.1.0 - Ubuntu 12.04 64-bit [gitlab_7.4.4-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/e99bcfc0601b020fc7d218bcd2e76fbcbc66c9d8/ubuntu-12.04/gitlab_7.4.4-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + MD5: 61cc01a792a0b649e5bfb51bd63adb12

- 7.4.3-ee/CI 5.1.0 - Ubuntu 12.04 64-bit [gitlab_7.4.3-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/e48726116808fc8b4e859aacf32bd7f12a569eab/ubuntu-12.04/gitlab_7.4.3-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + MD5: fcc033b7db38f5afc5bd21b991227ef1

- 7.4.3-ee - Ubuntu 12.04 64-bit [gitlab_7.4.3-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/d6cdce3171b469c3198828a6167f49d380817d18/ubuntu-12.04/gitlab_7.4.3-ee.omnibus.1-1_amd64.deb)
    + MD5: 1f01c05c238f380c546ffe8a767e5d48

- 7.4.2-ee - Ubuntu 12.04 64-bit [gitlab_7.4.2-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/cd86d1cb6d76231403ca0fba4ded395a6c753b9b/ubuntu-12.04/gitlab_7.4.2-ee.omnibus-1_amd64.deb)
    + MD5: 4851d59c5b304570eafd7ca1c4ce1617

- 7.4.1-ee - Ubuntu 12.04 64-bit [gitlab_7.4.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/fe8289d8a2ca90b5839012296ff1a89c4c58c5bd/ubuntu-12.04/gitlab_7.4.1-ee.omnibus-1_amd64.deb)
    + MD5: ee324001283b52d2d0dfd8ccba71d77e

- 7.4.0-ee - Ubuntu 12.04 64-bit [gitlab_7.4.0-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/417446d069cba775a883d22ea22955ac3e93d24a/ubuntu-12.04/gitlab_7.4.0-ee.omnibus.2-1_amd64.deb)
    + MD5: 879a821076353bc92add2e539ea0f6d1

- 7.3.2-ee - Ubuntu 12.04 64-bit [gitlab_7.3.2-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/c58e302c165ff0ee6eec240b6b6b15d02d82cd18/ubuntu-12.04/gitlab_7.3.2-ee.omnibus-1_amd64.deb)
    + MD5: 9b75edcb5c066bee223d69a3abd62256

- 7.3.1-ee - Ubuntu 12.04 64-bit [gitlab_7.3.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/84b514bea64be8ee065c222d318d7d37c237985e/ubuntu-12.04/gitlab_7.3.1-ee.omnibus-1_amd64.deb)
    + MD5: 35c573d2005f7bb7aa8406405f1a8e9d

- 7.3.0-ee - Ubuntu 12.04 64-bit [gitlab_7.3.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/5959588d95a915ee061daee467d1bc55a6316f7e/ubuntu-12.04/gitlab_7.3.0-ee.omnibus-1_amd64.deb)
    + MD5: e7fee9727ba8bf79aeb94afd5b219510

- 7.2.2-ee - Ubuntu 12.04 64-bit [gitlab_7.2.2-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/c55c6cbc34ea446e68382ac35d96c8722d2a87cd/ubuntu-12.04/gitlab_7.2.2-ee.omnibus-1_amd64.deb)
    + MD5: b4238977da83164e56772c17ea4e9d2c

- 7.2.1-ee - Ubuntu 12.04 64-bit [gitlab_7.2.1-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/c64e66c88063395e407f75174dfcdc9e833f7cc8/ubuntu-12.04/gitlab_7.2.1-ee.omnibus.2-1_amd64.deb)
    + MD5: 640703e4ff1a92ff912f56e869e4a38a

- 7.2.0-ee - Ubuntu 12.04 64-bit [gitlab_7.2.0-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/3173c5075e937a0f7940ceaba9f48c2249c07a7c/ubuntu-12.04/gitlab_7.2.0-ee.omnibus.2-1_amd64.deb)
    + MD5: aa9b5fb8defd6d4ed77fb7e5451442d8

- 7.1.1-ee - Ubuntu 12.04 64-bit [gitlab_7.1.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/71e1c0e770458056dc40709bf8b986ba83c0296d/ubuntu-12.04/gitlab_7.1.1-ee.omnibus-1_amd64.deb)
    + MD5: f6b84bc60b10556344e16175a19719ef

- 7.1.0-ee - Ubuntu 12.04 64-bit [gitlab_7.1.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/a4416b7b2ab2a50b74062471b7969f127ae01e03/ubuntu-12.04/gitlab_7.1.0-ee.omnibus-1_amd64.deb)
    + MD5: 07271fafd97f61a2fce5343970f4b4cc

- 7.0.1-ee - Ubuntu 12.04 64-bit [gitlab_7.0.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/e52f5de30db26d895438b81ea13ce6a89a22b3cc/ubuntu-12.04/gitlab_7.0.1-ee.omnibus-1_amd64.deb)
    + MD5: fc32a7de460dbfb3f0249cf3e1c56056

- 7.0.0-ee - Ubuntu 12.04 64-bit [gitlab_7.0.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/1ad8765351d114afdc9b96f1044551d209e6742c/ubuntu-12.04/gitlab_7.0.0-ee.omnibus-1_amd64.deb)
    - MD5: 4d243a7d075d940963ad0909e60e18e5

- 6.9.4-ee - Ubuntu 12.04 64-bit [gitlab_6.9.4-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/c0139737a5ffc2725eb5f72316c1d0f1d34d8944/ubuntu-12.04/gitlab_6.9.4-ee.omnibus.1-1_amd64.deb)
    - MD5: 85c7879a5e3c368c7d9d8b5c0bd8eed0

- 6.9.3-ee - Ubuntu 12.04 64-bit [gitlab_6.9.3-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/4cc3c248f50ecfc8048209da908e5ea62252190b/ubuntu-12.04/gitlab_6.9.3-ee.omnibus.1-1_amd64.deb)
    - MD5: d5a92e909e157638f8616041de1e9ff8

- 6.9.2-ee - Ubuntu 12.04 64-bit [gitlab_6.9.2-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/513969c5bd4ae079c27b61c792a86217eeb2c443/ubuntu-12.04/gitlab_6.9.2-ee.omnibus-1_amd64
    - MD5: 074fc4c035837c5671de5fea10ecfcec

- 6.9.1-ee - Ubuntu 12.04 64-bit [gitlab_6.9.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/f1b162213022e7c5def15ed773e2bfdf7d420590/ubuntu-12.04/gitlab_6.9.1-ee.omnibus-1_amd64.deb)
    - MD5: 52481cfaf8c555fb296c15facaf39900

- 6.9.0-ee - Ubuntu 12.04 64-bit [gitlab_6.9.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/f4bfa95fe308a10298178316aa140f5623536432/ubuntu-12.04/gitlab_6.9.0-ee.omnibus-1_amd64.deb)
    - MD5: 022feef5454b35ad49b9485149122c2e

- 6.8.1-ee - Ubuntu 12.04 64-bit [gitlab_6.8.1-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/aad7786fc512593733cc3351ebf515fb6f0d0462/ubuntu-12.04/gitlab_6.8.1-ee.omnibus.1-1_amd64.deb)
    - MD5: 4b7b3487f3631a261d56dc58e1922a11

- 6.8.0-ee - Ubuntu 12.04 64-bit [gitlab_6.8.0-ee.omnibus.4-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/788d9b718e820d3196295f2801b0bbec307e68a7/ubuntu-12.04/gitlab_6.8.0-ee.omnibus.4-1_amd64.deb)
    - MD5: 9a8a99ef147f30aa92ef5dddf85dfa97

- 6.7.4-ee - Ubuntu 12.04 64-bit [gitlab_6.7.4-ee.omnibus-1.ubuntu.12.04_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/e27eb70aac3619b17ba7ade0e6bfc48e896b057f/gitlab_6.7.4-ee.omnibus-1.ubuntu.12.04_amd64.deb)
    - MD5: 16d0c4ab627638cc6d612042af4498da

- 6.7.3-ee - Ubuntu 12.04 64-bit [gitlab_6.7.3-ee.omnibus.1-1.ubuntu.12.04_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/43c6dec1146d6335c6ca90fa8679d4e63962732e/gitlab_6.7.3-ee.omnibus.1-1.ubuntu.12.04_amd64.deb)
    - MD5: 527561c7b817f3375598778368530e9a

- 6.7.2-ee - Ubuntu 12.04 64-bit [gitlab_6.7.2-ee.omnibus.2-1.ubuntu.12.04_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/91692a0c3730d22621af07670b832e3ec1df7ee9/gitlab_6.7.2-ee.omnibus.2-1.ubuntu.12.04_amd64.deb)
    - MD5: 1deb3ac65cb2f25b00b489e52bf800e6

- 6.7.2-ee - Ubuntu 12.04 64-bit [gitlab_6.7.2-ee.omnibus-1.ubuntu.12.04_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/66e5962a62e403f30b63a6a709a894fdf6f8bc33/gitlab_6.7.2-ee.omnibus-1.ubuntu.12.04_amd64.deb)
    - MD5: 24d9618767217acd39c37cb7e0ae1881

- 6.7.1-ee Ubuntu 12.04 64-bit [gitlab_6.7.1-ee.omnibus-1.ubuntu.12.04_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/6d24b1dfb3a0ac4c80a7301bd42a32faf1e9d650/gitlab_6.7.1-ee.omnibus-1.ubuntu.12.04_amd64.deb)
    - MD5: cafba48596583b023758f35eaaaf98fa

- 6.6.3-ee Ubuntu 12.04 64-bit [gitlab_6.6.3-ee.omnibus.2-1.ubuntu.12.04_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/a7dcf16bd7948d5415a9c53176f2078375dac12e/gitlab_6.6.3-ee.omnibus.2-1.ubuntu.12.04_amd64.deb)
    - MD5: cbd2a9086691f0ea2ebe47b374e84151

- 6.6.3-ee Ubuntu 12.04 64-bit [gitlab_6.6.3-ee.omnibus-1.ubuntu.12.04_amd64.deb](https://downloads-packages.s3.amazonaws.com/2601c69af9247a47334c21cb9c9e4267d21eb8e7/gitlab_6.6.3-ee.omnibus-1.ubuntu.12.04_amd64.deb)
    - MD5: de0a2cf1b9876b9c07256aa7f5692677


### CentOS 6 64-bit

- 7.5.3-ee/CI 5.2.1 - CentOS 6 64-bit [gitlab-7.5.3_ee.omnibus.5.2.1.ci-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/09755469e681f852c4a81794c6ec640ed20a7f82/centos-6.6/gitlab-7.5.3_ee.omnibus.5.2.1.ci-1.el6.x86_64.rpm)
    + SHA256: 208b46fea67029cb3bbdfca593cd5866845b1a5b68cbd0b3d1f6201d9169ae00

- 7.5.2-ee/CI 5.2.1 - CentOS 6 64-bit [gitlab-7.5.2_ee.omnibus.5.2.1.ci-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/91595f2a0207e8456e9b7d86e4e529c80dc2f998/centos-6.6/gitlab-7.5.2_ee.omnibus.5.2.1.ci-1.el6.x86_64.rpm)
    + SHA256: 79d8d3c954466a539d4e33c4ba43bda090eae73fb3738ea98aaf281869fe80ac

- 7.5.1-ee/CI 5.2.0 - CentOS 6 64-bit [gitlab-7.5.1_ee.omnibus.5.2.0.ci-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/52cf99f7a5d7ab1ee9414b95d7875afce4c30525/centos-6.6/gitlab-7.5.1_ee.omnibus.5.2.0.ci-1.el6.x86_64.rpm)
    + SHA256: e50d86c483211734bc60ba039ce63b5e44d444f286759f119bd9899b1715df43

- 7.4.5-ee/CI 5.1.0 - CentOS 6 64-bit [gitlab-7.4.5_ee.omnibus.5.1.0.ci-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/db1bf2b0be4947b23bc3e9ff22a7059720ccfc3a/centos-6.6/gitlab-7.4.5_ee.omnibus.5.1.0.ci-1.el6.x86_64.rpm)
    + SHA256: 4fa6e9f4ef399833fd4e38194fc5acfc5914cc9f90adfa75ff674e7e054c5d83

- 7.4.4-ee/CI 5.1.0 - CentOS 6 64-bit [gitlab-7.4.4_ee.omnibus.5.1.0.ci-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/8cdc5c7ae898c51845669dacc09d844614e46f90/centos-6.5/gitlab-7.4.4_ee.omnibus.5.1.0.ci-1.el6.x86_64.rpm)
    + MD5: be5c4d977b647459c28ea587de1b82c4

- 7.4.3-ee/CI 5.1.0 - CentOS 6 64-bit [gitlab-7.4.3_ee.omnibus.5.1.0.ci-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/268e1049c800baeebaa6a2bbcec1b520d52c9587/centos-6.5/gitlab-7.4.3_ee.omnibus.5.1.0.ci-1.el6.x86_64.rpm)
    + MD5: 3e9753ce5d4580900a809da99c4b91de

- 7.4.3-ee - CentOS 6 64-bit [gitlab-7.4.3_ee.omnibus.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/0de6a7cef7e1c4b81dfb41b3aed5b29245521241/centos-6.5/gitlab-7.4.3_ee.omnibus.1-1.el6.x86_64.rpm)
    + MD5: 03fda4571bc087059214511c988819c5

- 7.4.2-ee - CentOS 6 64-bit [gitlab-7.4.2_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/0cacc003ce7d724eae04610af9adc8cf2c47f6cc/centos-6.5/gitlab-7.4.2_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: ab9c5fa50eaa337d6fcb13dadf83c7c7

- 7.4.1-ee - CentOS 6 64-bit [gitlab-7.4.1_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/0e35c2a4c7174facb186a892a5260cad168a6167/centos-6.5/gitlab-7.4.1_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: 6909bbb98071974a4ab9808c63e15f19

- 7.4.0-ee - CentOS 6 64-bit [gitlab-7.4.0_ee.omnibus.2-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/f26f3f667c432fb7d901cb8ec6d9933b6682f023/centos-6.5/gitlab-7.4.0_ee.omnibus.2-1.el6.x86_64.rpm)
    + MD5: 5fe5843b33d244edb7e53a65f1dddd46

- 7.3.2-ee - CentOS 6 64-bit [gitlab-7.3.2_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/e951c9049fdcb4719b62d32da4b5b20fb4ac06ba/centos-6.5/gitlab-7.3.2_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: 66dc5db39a230149bd6b4fa3543c1704

- 7.3.1-ee - CentOS 6 64-bit [gitlab-7.3.1_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/31cd8285078211e0c586e3ca55de835fbb4bd641/centos-6.5/gitlab-7.3.1_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: 1bb944331915bd1ab024f26f5363d5ac

- 7.3.0-ee - CentOS 6 64-bit [gitlab-7.3.0_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/e96783668115d01b2c11e7a68fe174055f2fa409/centos-6.5/gitlab-7.3.0_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: 3f79fd3a8df8c3f14b7731be0e71a0ce

- 7.2.2-ee - CentOS 6 64-bit [gitlab-7.2.2_ee.omnibus.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/0f1f8d86c7d33d063066e078d2f46d38199471a6/centos-6.5/gitlab-7.2.2_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: aac87719e12b89a8b7fbb8e76d08cf10

- 7.2.1-ee - CentOS 6 64-bit [gitlab-7.2.1_ee.omnibus.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/bfecfa9854037cf7c8d3d17c9fadebe06a30c908/centos-6.5/gitlab-7.2.1_ee.omnibus.1-1.el6.x86_64.rpm)
    + MD5: 6242e0715620d34e2f5329ba9bd74e23

- 7.2.0-ee - CentOS 6 64-bit [gitlab-7.2.0_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/2f0192626cfa99c6c86eeb9d340a7a5969d7943a/centos-6.5/gitlab-7.2.0_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: e2db09cfc46542fd4c53a669d4159b68

- 7.1.1-ee - CentOS 6 64-bit [gitlab-7.1.0_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/ba1aa90ff5662e790fd3eecfd6653e4377cada95/centos-6.5/gitlab-7.1.1_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: cee4f447c7ae99afd2bd6634a8a48000

- 7.1.0-ee - CentOS 6 64-bit [gitlab-7.1.0_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/de9f52c1c4cf611db78ad0548275c574d85cb220/centos-6.5/gitlab-7.1.0_ee.omnibus-1.el6.x86_64.rpm)
    + MD5: 35311bc3ae636b370c142aa10217d702

- 7.0.1-ee - CentOS 6 64-bit [gitlab-7.0.1_ee.omnibus.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/09a89ba7f0fe28ba9c4b52a492d02135e5a39a9c/centos-6.5/gitlab-7.0.1_ee.omnibus.1-1.el6.x86_64.rpm)
    + MD5: d9b518df79b2abd63ce70f1d028f5c30

- 7.0.0-ee - CentOS 6 64-bit [gitlab-7.0.0_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/6232e9f5ee819537011a57d3f8eb40c149795052/centos-6.5/gitlab-7.0.0_ee.omnibus-1.el6.x86_64.rpm)
    - MD5: 49a9eb63daba98bec85d3dbc175bac9d

- 6.9.4-ee - CentOS 6 64-bit [gitlab-6.9.4_ee.omnibus.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/60dc935248ddfdc182703f770ac8b55718b7bf94/centos-6.5/gitlab-6.9.4_ee.omnibus.1-1.el6.x86_64.rpm)
    - MD5: 17c358ff5edf868ccf3f07158b0ef382

- 6.9.3-ee - CentOS 6 64-bit [gitlab-6.9.3_ee.omnibus.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/2309ffd68483e2d74ef1b96566e7b68934abd99f/centos-6.5/gitlab-6.9.3_ee.omnibus.1-1.el6.x86_64.rpm)
    - MD5: 2e716a56643b93f0ee8d8c6cb5457952

- 6.9.2-ee - CentOS 6 64-bit [gitlab-6.9.2_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/8f0bde82158c3d542357f5ae5658bc4939f9d006/centos-6.5/gitlab-6.9.2_ee.omnibus-1.el6.x86_64.rpm)
    - MD5: 696c861da0a8a71d7df22c431ddb9619

- 6.9.1-ee - CentOS 6 64-bit [gitlab-6.9.1_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/c5bddcb7e781a16eca3bd5d6418f200cdfcdd311/centos-6.5/gitlab-6.9.1_ee.omnibus-1.el6.x86_64.rpm)
    - MD5: 4728394d750f28827c445ddc01f53580

- 6.9.0-ee - CentOS 6 64-bit [gitlab-6.9.0_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/f86f29bac6fa3e7cd96315550c362816fc04cdb4/centos-6.5/gitlab-6.9.0_ee.omnibus-1.el6.x86_64.rpm)
    - MD5: 18bd1bea069b968935eea489e4a24b50

- 6.8.1-ee - CentOS 6 64-bit [gitlab-6.8.1_ee.omnibus.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/e8f63c2a21cae7e9842c16b20d76b9de25d3130b/centos-6.5/gitlab-6.8.1_ee.omnibus.1-1.el6.x86_64.rpm)
    - MD5: 31895155f8f694ded61a04976a06baeb

- 6.8.0-ee - CentOS 6 64-bit [gitlab-6.8.0_ee.omnibus.4-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/0a6d0e42b82d64a4c4ec6bbe448ffc0a5cfb70ab/centos-6.5/gitlab-6.8.0_ee.omnibus.4-1.el6.x86_64.rpm)
    - MD5: 6648d41b02712c1d701d8361490126e7

- 6.7.4-ee - CentOS 6 64-bit [gitlab-6.7.4_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/e9394ffe2dd9cba518ab6d43510fb0fb6acc4ff6/gitlab-6.7.4_ee.omnibus-1.el6.x86_64.rpm)
    - MD5: 5004af120eb457fe7eefbaa5f47429dc

- 6.7.3-ee - CentOS 6 64-bit [gitlab-6.7.3_ee.omnibus.1-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/4a83046ae506fe84158c1bc433d8fa85a886abba/gitlab-6.7.3_ee.omnibus.1-1.el6.x86_64.rpm)
    - MD5: 6335719321acc8edc2f718570960c832

- 6.7.2-ee CentOS 6 64-bit [gitlab-6.7.2_ee.omnibus.2-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/e13ccafca35955ad754ea501798875d99e0cce4c/gitlab-6.7.2_ee.omnibus.2-1.el6.x86_64.rpm)
    - MD5: 36347c81013c4215226a3cb30f6ac1b4

- 6.7.2-ee - CentOS 6 64-bit [gitlab-6.7.2_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/d8fd3ffca4c88ec2cd056cf0abb76fa5fc2c9236/gitlab-6.7.2_ee.omnibus-1.el6.x86_64.rpm)
    - MD5: 783db81d088e1fa679e8608672e83adb

- 6.7.1-ee - CentOS 6 64-bit [gitlab-6.7.1_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/bc91ee44fe1d23d9816e2497ff2fb23ad5efbbd4/gitlab-6.7.1_ee.omnibus-1.el6.x86_64.rpm)
    - MD5: 5271918a5610f972b6c10225b151ad81

- 6.6.3-ee - CentOS 6 64-bit [gitlab-6.6.3_ee.omnibus.2-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/9fdbc4650df67d3a55c94fe7dced4fb9161aa056/gitlab-6.6.3_ee.omnibus.2-1.el6.x86_64.rpm)
    - MD5: e7f8e1bfe3f6f8173fce204e3903672c

- 6.6.2-ee - CentOS 6 64-bit [gitlab-6.6.2_ee.omnibus-1.el6.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/32f814ce19709276846c281cac23b934f91beb06/gitlab-6.6.2_ee.omnibus-1.el6.x86_64.rpm)
    - MD5: e4414bf4c4b13e30a35c8578943bb7a1

### CentOS 7 64-bit

- 7.5.3-ee/CI 5.2.1 - CentOS 7 64-bit [gitlab-7.5.3_ee.omnibus.5.2.1.ci-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/f08d577a156a0bf4ef06f4b42586a94707d2e456/centos-7.0.1406/gitlab-7.5.3_ee.omnibus.5.2.1.ci-1.el7.x86_64.rpm)
    + SHA256: d3e734f37841b38f37892ea5557a7c707f0e7bba8bf5f70869f309bd8f21120a

- 7.5.2-ee/CI 5.2.1 - CentOS 7 64-bit [gitlab-7.5.2_ee.omnibus.5.2.1.ci-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/01fe47e4a0b4f27da31edfc40e8bb2c695fa1647/centos-7.0.1406/gitlab-7.5.2_ee.omnibus.5.2.1.ci-1.el7.x86_64.rpm)
    + SHA256: 0543dcfccd229d37934a069cb151b14bf61f2f8a6dcb78e8aeb14cfdb0fecb47

- 7.5.1-ee/CI 5.2.0 - CentOS 7 64-bit [gitlab-7.5.1_ee.omnibus.5.2.0.ci-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/cbe0e6ef39dc93d791707f5f715d4009034f74fc/centos-7.0.1406/gitlab-7.5.1_ee.omnibus.5.2.0.ci-1.el7.x86_64.rpm)
+ SHA256: e184d321f2d3bff994be9b7a66a76a4ec84fc88fb299b22a66d1ce90d551a970

- 7.4.5-ee/CI 5.1.0 - CentOS 7 64-bit [gitlab-7.4.5_ee.omnibus.5.1.0.ci-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/9cb022483de75b25e9ed55f0a89b8f6de01da8d8/centos-7.0.1406/gitlab-7.4.5_ee.omnibus.5.1.0.ci-1.el7.x86_64.rpm)
    + SHA256: 50aebcda2b2a0b65527636b7ed4deded23e20dfeb6049d8fc167a441654af5e8

- 7.4.4-ee/CI 5.1.0 - CentOS 7 64-bit [gitlab-7.4.4_ee.omnibus.5.1.0.ci-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/b5a6e03222854e741d1c0e0cf37748d5b79beac5/centos-7.0.1406/gitlab-7.4.4_ee.omnibus.5.1.0.ci-1.el7.x86_64.rpm)
    + MD5: 88d34e3705ca8317e61a2cf91ef101af

- 7.4.3-ee/CI 5.1.0 - CentOS 7 64-bit [gitlab-7.4.3_ee.omnibus.5.1.0.ci-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/f4535b85fe82f08ed758d77284572db0f5a8c141/centos-7.0.1406/gitlab-7.4.3_ee.omnibus.5.1.0.ci-1.el7.x86_64.rpm)
    + MD5: 9a1da05ff685348edc44ab2bcf419401

- 7.4.3-ee - CentOS 7 64-bit [gitlab-7.4.3_ee.omnibus.1-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/6fb497096e614fc9e06a97e2340c42c6eff902a7/centos-7.0.1406/gitlab-7.4.3_ee.omnibus.1-1.el7.x86_64.rpm)
    + MD5: 4437aa26a37e6755741cd17cf8b0ace1

- 7.4.2-ee - CentOS 7 64-bit [gitlab-7.4.2_ee.omnibus-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/34271e331e786ffb2ea436ba2f872be091d9a985/centos-7.0.1406/gitlab-7.4.2_ee.omnibus-1.el7.x86_64.rpm)
    + MD5: 54cbef1653422906aa912925c4821e80

- 7.4.1-ee - CentOS 7 64-bit [gitlab-7.4.1_ee.omnibus-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/7fec37a0e4f36281269260bdbd0b911acfb8593b/centos-7.0.1406/gitlab-7.4.1_ee.omnibus-1.el7.x86_64.rpm)
    + MD5: 6d5e0c2be3ab694a17536c7ff93e88c4

- 7.4.0-ee - CentOS 7 64-bit [gitlab-7.4.0_ee.omnibus.2-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/9b33aa1758a695f38898818a4fdd79529d123dc6/centos-7.0.1406/gitlab-7.4.0_ee.omnibus.2-1.el7.x86_64.rpm)
    + MD5: 9489913a4250df7691f6037dc5f26c3e

- 7.3.2-ee - CentOS 7 64-bit [gitlab-7.3.2_ee.omnibus-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/e5c37348729adcb27801dd2bd6c580f88b49e6ad/centos-7.0.1406/gitlab-7.3.2_ee.omnibus-1.el7.x86_64.rpm)
    + MD5: 123e637a7e75ff8506bb95b2727a5a97

- 7.3.1-ee - CentOS 7 64-bit [gitlab-7.3.1_ee.omnibus-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/3050e92537dea21bfe91a5c81037d778a00f19aa/centos-7.0.1406/gitlab-7.3.1_ee.omnibus-1.el7.x86_64.rpm)
    + MD5: fb1baf16e1937634359961656ac3d18c

- 7.3.0-ee - CentOS 7 64-bit [gitlab-7.3.0_ee.omnibus-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/18ad7ed255618bf1d3d1a26e0eaff324f609e8a2/centos-7.0.1406/gitlab-7.3.0_ee.omnibus-1.el7.x86_64.rpm)
    + MD5: c75673bed7add69c032606db9581b13f

- 7.2.2-ee - CentOS 7 64-bit [gitlab-7.2.2_ee.omnibus.1-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/8ec5d93f4c7b6884a85fe3a0b4f6e4f1ab561de4/centos-7.0.1406/gitlab-7.2.2_ee.omnibus-1.el7.x86_64.rpm)
    + MD5: d9122c6afb70f059c8c9d63691db6bb7

- 7.2.1-ee - CentOS 7 64-bit [gitlab-7.2.1_ee.omnibus.1-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/3769df612d984a89472ddd55a1c7edd76ba5d245/centos-7.0.1406/gitlab-7.2.1_ee.omnibus.1-1.el7.x86_64.rpm)
    + MD5: 1d3cee97374e1b4e9eda9afad7e75057

- 7.2.0-ee - CentOS 7 64-bit [gitlab-7.2.0_ee.omnibus.1-1.el7.x86_64.rpm](https://s3-eu-west-1.amazonaws.com/downloads-packages/74a4d7a4e9406253f7ba7fff1e83c67122d7f12d/centos-7.0.1406/gitlab-7.2.0_ee.omnibus.1-1.el7.x86_64.rpm)
    + MD5: 77b343220a36d39a1c167355ccb7c8fc


### Debian 7 64-bit

- 7.5.3-ee/CI 5.2.1 - Debian 7 64-bit [gitlab_7.5.3-ee.omnibus.5.2.1.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/9e2aa73766f581642ff10daac1dcbdaff44f6040/debian-7.6/gitlab_7.5.3-ee.omnibus.5.2.1.ci-1_amd64.deb)
    + SHA256: f370fe69342c36a84080a19ccc2f9dfce5c70cdf99922b5381fabf126b0c203e

- 7.5.2-ee/CI 5.2.1 - Debian 7 64-bit [gitlab_7.5.2-ee.omnibus.5.2.1.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/9e4146057f068039938937722a26ed9b3eef755b/debian-7.6/gitlab_7.5.2-ee.omnibus.5.2.1.ci-1_amd64.deb)
    + SHA256: 8a60a952e400cba552356613e4bd299eb8e23f982de6494d7c4207e3708a3a27

- 7.5.1-ee/CI 5.2.0 - Debian 7 64-bit [gitlab_7.5.1-ee.omnibus.5.2.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/4cd93dae8f910df1ffcc2e13dca77c6e99f6262e/debian-7.6/gitlab_7.5.1-ee.omnibus.5.2.0.ci-1_amd64.deb)
+ SHA256: 4e5812b72518dd911024c578c3abd827ae0b112781ab21d0f5821a004ba66007

- 7.4.5-ee/CI 5.1.0 - Debian 7 64-bit [gitlab_7.4.5-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/263e437825ad04d972b8a29fd1b95e3fa9d2eca5/debian-7.6/gitlab_7.4.5-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + SHA256: 16cef31906a1508869b91565fc71c1dfb9c712789e56554c3177341bd1f8903e

- 7.4.4-ee/CI 5.1.0 - Debian 7 64-bit [gitlab_7.4.4-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/57faf07036cda6780f9c55da6aaefad97218f835/debian-7.6/gitlab_7.4.4-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + MD5: 0690cc175b8563239a374c5d2001254c

- 7.4.3-ee/CI 5.1.0 - Debian 7 64-bit [gitlab_7.4.3-ee.omnibus.5.1.0.ci-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/312e79a2724f10353c68c4e4ebc68d7c706939ae/debian-7.6/gitlab_7.4.3-ee.omnibus.5.1.0.ci-1_amd64.deb)
    + MD5: d4ddb61274bca6d7268d2e3613ea5654

- 7.4.3-ee - Debian 7 64-bit [gitlab_7.4.3-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/15a6fd75f742b239a4589aa54dad7cd382d46e00/debian-7.6/gitlab_7.4.3-ee.omnibus.1-1_amd64.deb)
    + MD5: e513fba07fdc84ab0e4f8bc10f9b4a90

- 7.4.2-ee - Debian 7 64-bit [gitlab_7.4.2-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/93b1781f1ef5bf910075fa23bd609d504c5875a0/debian-7.6/gitlab_7.4.2-ee.omnibus-1_amd64.deb)
    + MD5: 21f097081c2c94edf91bc2d35fc5821a

- 7.4.1-ee - Debian 7 64-bit [gitlab_7.4.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/aded923f200d89ec22f70e2edc6c12146f3e605a/debian-7.6/gitlab_7.4.1-ee.omnibus-1_amd64.deb)
    + MD5: 901115747079fbab658078f268991596

- 7.4.0-ee - Debian 7 64-bit [gitlab_7.4.0-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/22be93e9b1d13b05c94dfa5c77ac1210932b92e1/debian-7.6/gitlab_7.4.0-ee.omnibus.2-1_amd64.deb)
    + MD5: b887551f922d97b41f5c9fbd0814ef3f

- 7.3.2-ee - Debian 7 64-bit [gitlab_7.3.2-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/daf694d5de05b57c2fd1ecb05f8bd49b4ae8dd5b/debian-7.6/gitlab_7.3.2-ee.omnibus-1_amd64.deb)
    + MD5: b57dc8b083680aa30b6ad5c4186a5194

- 7.3.1-ee - Debian 7 64-bit [gitlab_7.3.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/e89bc59a8001adf3349a89913c9ea4f25c217d59/debian-7.6/gitlab_7.3.1-ee.omnibus-1_amd64.deb)
    + MD5: 51d8206aaee69d3d3a1236bf61cc4b8a

- 7.3.0-ee - Debian 7 64-bit [gitlab_7.3.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/37b500c5c99269354366f74ee6f4558dd5aa7fe1/debian-7.6/gitlab_7.3.0-ee.omnibus-1_amd64.deb)
    + MD5: 4488f302d1f1c5278282b199f8246490

- 7.2.2-ee - Debian 7 64-bit [gitlab_7.2.2-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/f3ce6ab1750ab3cf54fa4685d83b2c0cdb846867/debian-7.6/gitlab_7.2.2-ee.omnibus-1_amd64.deb)
    + MD5: 392815a9b63e2f4c1ba69111ad509264

- 7.2.1-ee - Debian 7 64-bit [gitlab_7.2.1-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/f5508877220d49dc7abf9bdb6b5f016fa4deb46a/debian-7.6/gitlab_7.2.1-ee.omnibus.2-1_amd64.deb)
    + MD5: 8fbcb93fcb2c6a09a3a8b5d86d2b8d85

- 7.2.0-ee - Debian 7 64-bit [gitlab_7.2.0-ee.omnibus.2-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/49ca44c4b6a815993d878d8a42a653fb71672f0c/debian-7.6/gitlab_7.2.0-ee.omnibus.2-1_amd64.deb)
    + MD5: 36166f60d990afd1d76217ad23bd9e5d

- 7.1.1-ee - Debian 7 64-bit [gitlab_7.1.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/15e4d859ee875474aed4d28e85ab363513ab9967/debian-7.5/gitlab_7.1.1-ee.omnibus-1_amd64.deb)
    - MD5: b25110d4dd807c968aa593afd2c9ea8b

- 7.1.0-ee - Debian 7 64-bit [gitlab_7.1.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/f25023e63a9c8782c05a1f3bcc3ed45cd8e15136/debian-7.5/gitlab_7.1.0-ee.omnibus-1_amd64.deb)
    - MD5: 800b904ab58a66c95b4b9e2771233a81

- 7.0.1-ee - Debian 7 64-bit [gitlab_7.0.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/c0190e8bf1fc0b61f27c3482e26ccc8adc58e82e/debian-7.5/gitlab_7.0.1-ee.omnibus-1_amd64.deb)
    - MD5: 572866c64e3dc2bead15566abd1590c2

- 7.0.0-ee - Debian 7 64-bit [gitlab_7.0.0-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/0abbb828dccfc70557caf9fd07ea302e14cc07dd/debian-7.5/gitlab_7.0.0-ee.omnibus-1_amd64.deb)
    - MD5: 823ff3cf365aead9a641169c43171ea9

- 6.9.4-ee - Debian 7 64-bit [gitlab_6.9.4-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/1b5bc6d0d291eef9a6399383d6a8f13b01c09e47/debian-7.5/gitlab_6.9.4-ee.omnibus.1-1_amd64.deb)
    - MD5: c31b66def74400dcc95625b6cc886191

- 6.9.3-ee - Debian 7 64-bit [gitlab_6.9.3-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/029b026311e688f1865ba9e8f7c9e4b4d01fbdc2/debian-7.5/gitlab_6.9.3-ee.omnibus.1-1_amd64.deb)
    - MD5: 643e6d26d31b5b1166b9f67de299b450

- 6.9.2-ee - Debian 7 64-bit [gitlab_6.9.2-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/d33ef3d41af88acd847d0199678a1e3503fbbaa0/debian-7.4/gitlab_6.9.2-ee.omnibus-1_amd64.deb)
    - MD5: 8027344d00d3d26abbd87b754a42fe2c

- 6.9.1-ee - Debian 7 64-bit [gitlab_6.9.1-ee.omnibus-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/0a8357d7282de4350c45ebdcc109ab653978a03d/debian-7.4/gitlab_6.9.1-ee.omnibus-1_amd64.deb)
    - MD5: 8ea5d343bc60b984ef44325d03180f27

- 6.9.0-ee - Debian 7 64-bit [gitlab_6.9.0-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/9a604b7d3f4b57d7ebf34c26e034fb99dbe90ebf/debian-7.4/gitlab_6.9.0-ee.omnibus.1-1_amd64.deb)
    - MD5: 4831a0b7dff2abf7982aaefae88a66f4

- 6.8.1-ee - Debian 7 64-bit [gitlab_6.8.1-ee.omnibus.1-1_amd64.deb](https://s3-eu-west-1.amazonaws.com/downloads-packages/42982fb41464911692bcf98692bb5858a0bba009/debian-7.4/gitlab_6.8.1-ee.omnibus.1-1_amd64.deb)
    - MD5: fb0510d75a2672b605575439e4107ce9

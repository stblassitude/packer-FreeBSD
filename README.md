# packer-freebsd

![Version](https://img.shields.io/github/tag/stblassitude/packer-freebsd.svg?maxAge=2592000)
[![License](https://img.shields.io/github/license/stblassitude/packer-freebsd.svg?maxAge=2592000)](https://tldrlegal.com/license/creative-commons-cc0-1.0-universal)
[![CircleCI](https://img.shields.io/circleci/project/stblassitude/packer-freebsd.svg?maxAge=2592000)](https://circleci.com/gh/stblassitude/packer-freebsd)

packer template to build FreeBSD (with zfsroot) images, based on the work
by [uchida/packer-freebsd](https://github.com/uchida/packer-freebsd).

vagrant images are available at [stblassitude/freebsd-11](https://atlas.hashicorp.com/stblassitude/boxes/freebsd-11).

```console
vagrant init stblassitude/freebsd-11; vagrant up --provider virtualbox
```

## Building Images

To build images, simply run:

```console
$ git clone https://github.com/stblassitude/packer-freebsd
$ cd packer-freebsd
$ packer build template.json
```

If you want to build only virtualbox, vmware or qemu.

```console
$ packer build -only=virtualbox-iso template.json
$ packer build -only=vmware-iso template.json
$ packer build -only=qemu template.json
```

## Release setup

Vagrant images at [Atlas](https://atlas.hashicorp.com) are released by [Circle CI](https://circleci.com/).
setup instructions are the following:

1. Sign up
  - [Atlas](https://atlas.hashicorp.com/account/new)
  - [Circle CI](https://circleci.com/signup).
2. Get API token
  - [Atlas](https://atlas.hashicorp.com/settings/tokens)
  - [Circle CI](https://circleci.com/account/api)
3. Create new build configuration at [Atlas](https://atlas.hashicorp.com/builds/new)
  and [generate token](https://atlas.hashicorp.com/settings/tokens).
4. Create project at [Circle CI](https://circleci.com/add-projects)
5. Add Atlas environment variables to Circle CI project:

  ```console
  $ ATLAS_TOKEN={{ your atlas api token here }}
  $ CIRCLE_USERNAME={{ your circle ci username here }}
  $ CIRCLE_PROJECT={{ your circle ci project here }}
  $ CIRCLE_TOKEN={{ your circle ci token here }}
  $ CIRCLE_ENVVARENDPOINT="https://circleci.com/api/v1/project/$CIRCLE_USERNAME/$CIRCLE_PROJECT/envvar?circle-token=$CIRCLE_TOKEN"
  $ json="{\"name\":\"ATLAS_TOKEN\",\"value\":\"$ATLAS_TOKEN\"}"
  $ curl -X POST -H "Content-Type: application/json" -H "Accept: application/json" -d "$json" "$CIRCLE_ENVVARENDPOINT"
  ```

6. Edit circle.yml

## License

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")]
(http://creativecommons.org/publicdomain/zero/1.0/deed)

dedicated to public domain, no rights reserved.

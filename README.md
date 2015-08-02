# newcontext-demo-site

Simple cookbook that pulls down a demo site to be served by Nginx

## Supported Platforms

Tested against CentOS; will likely work on other Linux platforms (caveat emptor)

## Attributes

Key | Type | Description  | Default
----|------|--------------|--------
`['newcontext-demo-site']['repo_base_url']` | `String` | Base URL of the repository to retrieve | `https://github.com/puppetlabs`
`['newcontext-demo-site']['repo_name']` | `String` | Repository Name | `exercise-webpage`
`['newcontext-demo-site']['repo_branch']` | `String` | Repository Branch | `master`
`['newcontext-demo-site']['tmp_dir']` | `String` | Directory in which to store downloads | `/tmp`

## Usage

### newcontext-demo-site::default

Deploys the content of the specified `repo_name` to the Nginx web root. 
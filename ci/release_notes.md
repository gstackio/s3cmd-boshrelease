### Improvements

- Now supports [Ubuntu Bionic Stemcells](https://bosh.io/stemcells#ubuntu-bionic)
- Bumped the `s3cmd` utility to v2.2.0, and Python to v3.10.0
- Added a new `sync-local-blobs-to-s3` errand to help migrating “local” Nginx-based blobstore to some S3 external blobstore
- Added Concourse pipeline with tests to automate CI/CD for this Bosh Release

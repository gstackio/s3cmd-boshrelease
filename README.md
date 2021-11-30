s3cmd BOSH Release
==================

This BOSH Relase provides two errands `create-buckets` and `remove-buckets`
that can help in creating or destroing S3 buckets, using the
[`s3cmd`][s3cmd_repo] CLI.

A third `sync-local-blobs-to-s3` errand is designed to be deployed on a Bosh
Director VM. When triggered, it copies the local blobs of the Nginx-based
blobstore to some bucket in an external S3 server. This is useful when
migrating from a “local” Nginx-based blobstore to an external S3 blobstore.
Using an external S3 blobstore provides more reliabile object storage for a
BOSH Director or a Cloud Foundry deployment. For convenience, the
configuration for this errand matches closely the one used by the Bosh
Director.

[s3cmd_repo]: https://github.com/s3tools/s3cmd



Contributing
------------

Please feel free to submit issues and pull requests.

The `add-blobs.sh` script helps in re-building the release blobs when
necessary.

CI/CD is made in a Concourse pipeline. Status of the tests run are sbmitted
back to GitHub by Concourse.



Author and License
------------------

Copyright © 2018-present, Benjamin Gandon, Gstack

Like the rest of BOSH, the s3cmd BOSH release is released under the terms
of the [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0).

<!--
# Local Variables:
# indent-tabs-mode: nil
# End:
-->

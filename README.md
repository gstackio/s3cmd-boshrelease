s3cmd BOSH Release
==================

This BOSH Relase provides two errands `create-buckets` and `remove-buckets` in
order to create or destroy S3 buckets, using the [`s3cmd`][s3cmd_repo] CLI.

This can be useful to migrate “local” Nginx-based blobstores to S3 external
blobstores too. This is a common use-case when in need for more reliabile
object storage for a BOSH Director or a Cloud Foundry deployment.

[s3cmd_repo]: https://github.com/s3tools/s3cmd



Contributing
------------

Please feel free to submit issues and pull requests.



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

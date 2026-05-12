#!/usr/bin/env bash
set -euo pipefail

for table in \
               \
               OrgDownloadRateLimit OrgGroupRepo OrgInnerPubRepo OrgRepo OrgSharedRepo \
               OrgUploadRateLimit OrgUserDefaultQuota RepoStorageId \
               RepoSyncError RoleDownloadRateLimit RoleQuota \
               RoleUploadRateLimit UserDownloadRateLimit UserUploadRateLimit \
               WebUploadTempFiles; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\"" || true
done

#!/usr/bin/env bash
set -euo pipefail

for table in \
               FileLockTimestamp FolderGroupPerm FolderPermTimestamp FolderUserPerm \
               GCID LastGCID OrgDownloadRateLimit OrgGroupRepo OrgInnerPubRepo OrgRepo OrgSharedRepo \
               OrgUploadRateLimit OrgUserDefaultQuota RepoStorageId \
               RepoSyncError RoleDownloadRateLimit RoleQuota \
               RoleUploadRateLimit SeafileConf UserDownloadRateLimit UserUploadRateLimit \
               WebUploadTempFiles FileLocks; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\"" || true
done

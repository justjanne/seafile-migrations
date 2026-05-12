#!/usr/bin/env bash
set -euo pipefail

for table in \
               FileLockTimestamp FolderGroupPerm FolderPermTimestamp FolderUserPerm \
               GarbageRepos GCID LastGCID OrgDownloadRateLimit OrgGroupRepo OrgInnerPubRepo OrgRepo OrgSharedRepo \
               OrgUploadRateLimit OrgUserDefaultQuota RepoFileCount RepoInfo RepoStorageId \
               RepoSyncError RepoTrash RoleDownloadRateLimit RoleQuota \
               RoleUploadRateLimit SeafileConf UserShareQuota UserDownloadRateLimit UserUploadRateLimit \
               WebUploadTempFiles FileLocks; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\"" || true
done

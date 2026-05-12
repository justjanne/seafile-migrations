#!/usr/bin/env bash
set -euo pipefail

for table in \
               FolderGroupPerm FolderPermTimestamp FolderUserPerm \
               OrgDownloadRateLimit OrgGroupRepo OrgInnerPubRepo OrgRepo OrgSharedRepo \
               OrgUploadRateLimit OrgUserDefaultQuota RepoStorageId \
               RepoSyncError RoleDownloadRateLimit RoleQuota \
               RoleUploadRateLimit UserDownloadRateLimit UserUploadRateLimit \
               WebUploadTempFiles; do
  mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`$table\`" || true
done

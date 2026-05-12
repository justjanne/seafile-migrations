#!/usr/bin/env bash
set -euo pipefail

for table in RepoUserToken \
               WebAP FileLockTimestamp FolderGroupPerm FolderPermTimestamp FolderUserPerm \
               GarbageRepos GCID LastGCID OrgDownloadRateLimit OrgGroupRepo OrgInnerPubRepo OrgRepo OrgSharedRepo \
               OrgUploadRateLimit OrgUserDefaultQuota RepoFileCount RepoHistoryLimit RepoInfo RepoStorageId \
               RepoSyncError RepoTokenPeerInfo RepoTrash RepoValidSince RoleDownloadRateLimit RoleQuota \
               RoleUploadRateLimit SeafileConf SystemInfo UserShareQuota UserDownloadRateLimit UserUploadRateLimit \
               VirtualRepo WebUploadTempFiles FileLocks; do
  mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`$table\`" || true
done

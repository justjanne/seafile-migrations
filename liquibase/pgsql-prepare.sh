#!/usr/bin/env bash
set -euo pipefail

for table in InnerPubRepo OrgQuota OrgUserQuota RepoSize RepoUserToken \
               SharedRepo UserQuota WebAP FileLockTimestamp FolderGroupPerm FolderPermTimestamp FolderUserPerm \
               GarbageRepos GCID LastGCID OrgDownloadRateLimit OrgGroupRepo OrgInnerPubRepo OrgRepo OrgSharedRepo \
               OrgUploadRateLimit OrgUserDefaultQuota RepoFileCount RepoHistoryLimit RepoInfo RepoStorageId \
               RepoSyncError RepoTokenPeerInfo RepoTrash RepoValidSince RoleDownloadRateLimit RoleQuota \
               RoleUploadRateLimit SeafileConf SystemInfo UserShareQuota UserDownloadRateLimit UserUploadRateLimit \
               VirtualRepo WebUploadTempFiles FileLocks; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\"" || true
done

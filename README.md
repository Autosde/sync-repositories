# Sync repositories action
This action sync 2 repos, using push  with force
## Inputs

### `repo_to`

**Required** The repository we want to sync to. Default `"Autosde/manageiq""`.

### `repo_from`

**Required** The repository we want to sync from. Default `"IBM/manageiq"`.

### `branch`

**Required** The name of the branch on both repo. Default `"master"`.

### `token`

** Personal access token (PAT), defined for current repo
## Example usage

```yaml

jobs:
  sync-manageiq:
    runs-on: ubuntu-latest
    steps:
    - name: sync
      uses: Autosde/sync-repositories@main
      with:
        token: ${{ env.REPO_KEY }}
        repo_from: IBM/manageiq
        repo_to: Autosde/manageiq
```

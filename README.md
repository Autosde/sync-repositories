# Sync repositories action
This action prints "Hello World" to the log or "Hello" + the name of a person to greet. To learn how this action was built, see "[Creating a Docker container action](https://help.github.com/en/articles/creating-a-docker-container-action)" in the GitHub Help documentation.

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

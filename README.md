# Decrypt secrets Action

## Usage

Decrypt given secrets

```yaml
    - name: Decrypt GPG secrets
      uses: minddocdev/decrypt-action@master
      with:
        files: file1,file2
        passphrase: ${{ secrets.SECRETS_PASSPHRASE }}
```

## Test

```sh
docker build -t minddocdev/decrypt-action .
```

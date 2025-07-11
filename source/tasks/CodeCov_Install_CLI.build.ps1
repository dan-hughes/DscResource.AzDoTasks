param ()

task CodeCov_Install_CLI {
    curl 'https://keybase.io/codecovsecurity/pgp_keys.asc' | gpg --no-default-keyring --import
    curl -Os 'https://cli.codecov.io/latest/linux/codecov'
    curl -Os 'https://cli.codecov.io/latest/linux/codecov.SHA256SUM'
    curl -Os 'https://cli.codecov.io/latest/linux/codecov.SHA256SUM.sig'
    gpg --verify codecov.SHA256SUM.sig codecov.SHA256SUM
    shasum -a 256 -c codecov.SHA256SUM
    chmod +x codecov
}

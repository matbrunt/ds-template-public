# Changelog

Run the following command from the cookiecutter template directory to build the supporting Docker image for this project structure.

```bash
docker image build -f docker/explore/explore.dockerfile -t matbrunt/analysis:latest -t matbrunt/analysis:v0.4 .
```

## Revisions

### v0.3

- Added work pip packages

- Added support for Google BigQuery

- Switched docker image to `matbrunt/analysis` from personal `honir/analysis` image

### v0.2

- Fixed bug with project root dir path

- Added `pip_packages.txt` to Docker image for pip installations

### v0.1

- Initial project creation
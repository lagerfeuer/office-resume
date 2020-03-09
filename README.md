# resume-template

## Requirements
* XeTeX
* latexmk
* _optional:_ make

## Build
### Make
```sh
make cover-letter
make resume

# make latexmk continuously build on change
make cont=true cover-letter
make cont=true resume
```

### latexmk
```sh
latexmk -pdf -output-directory=out/ cover-letter.tex
latexmk -pdf -output-directory=out/ resume.tex

# make latexmk continuously build on change
latexmk -pvc -output-directory=out/ cover-letter.tex
latexmk -pvc -output-directory=out/ resume.tex
```

### Docker Build
Docker image: `lagerfeuer/xetexlive:latest`

```sh
docker run \
  --rm -v $(pwd):/resume --workdir=/resume \
  lagerfeuer/xetexlive-more:latest \
  make cover-letter resume
```

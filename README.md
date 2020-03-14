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
make cont=true coverletter
make cont=true resume
```

### latexmk
```sh
latexmk -pdf -output-directory=out/ coverletter.tex
latexmk -pdf -output-directory=out/ resume.tex

# make latexmk continuously build on change
latexmk -pvc -output-directory=out/ coverletter.tex
latexmk -pvc -output-directory=out/ resume.tex
```

### Docker Build
Docker image: `lagerfeuer/xetexlive:latest`

```sh
docker run \
  --rm -v $(pwd):/resume --workdir=/resume \
  lagerfeuer/xetexlive-more:latest \
  make coverletter resume
```

## Showcase
### All colors
To see all color options that are included by default, run
```sh
make allcolors
```
and open the files `out/resume-allcolors.pdf` and `out/coverletter-allcolors.pdf`.

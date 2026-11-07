# compute-document-utils

**Documents in. PDFs and images out.**

`bsantanna/compute-document-utils` turns stacks of Word and PowerPoint files into PDFs, and PDFs into page images — in bulk, headless, with one pipe. Powered by LibreOffice and Poppler.

## Run it

Convert every `.docx` and `.pptx` in a folder to PDF:

```sh
find . -name '*.docx' -o -name '*.pptx' | \
  docker run -i --rm -v "$PWD:/work" -w /work bsantanna/compute-document-utils convert_to_pdf
```

Turn every PDF into one JPEG per page:

```sh
find . -name '*.pdf' | \
  docker run -i --rm -v "$PWD:/work" -w /work bsantanna/compute-document-utils extract_images
```

Output lands next to each source file: `report.docx` becomes `report.pdf`, and `report.pdf` becomes `report-page-1.jpg`, `report-page-2.jpg`, and so on.

## Commands

| Command | Reads from stdin | Produces |
|---|---|---|
| `convert_to_pdf` | Paths to `.docx` or `.pptx` files | A PDF beside each file |
| `extract_images` | Paths to `.pdf` files | One 72 DPI JPEG per page beside each file |

Unsupported or missing files are skipped and reported, so one bad path never stops the batch.

## What's inside

| | |
|---|---|
| Conversion | LibreOffice Writer and Impress, headless |
| Rendering | Poppler (`pdftoppm`, `pdftotext` and friends) |
| Also included | Python 3.12, Java 25 and the tools from [`bsantanna/java-python-dev`](https://hub.docker.com/r/bsantanna/java-python-dev) |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in pipelines. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/compute/document-utils)

# Challenge 1A: PDF Processing Solution

### Team CodeHers  
**Kriti Katyal**  
**Siya Verma**


## Overview
This solution processes PDF documents to extract their hierarchical structure (headings and sections) and saves the organized content as JSON files. The system intelligently identifies document headings using both typographical analysis and content patterns.

## Technical Approach

### PDF Processing Pipeline
1. **Font Analysis**:
   - Extracts font sizes and names from all text elements
   - Calculates median font size to establish baseline text size
   - Identifies headings through relative size differences

2. **Heading Detection**:
   - Uses multiple heuristics to identify heading levels:
     - Font size relative to document median
     - Text patterns (numbered sections, chapter markers, etc.)
     - Structural cues (colons, bullet points, etc.)
   - Classifies headings into hierarchical levels (H1-H4)

3. **Content Organization**:
   - Groups related content under detected headings
   - Removes duplicate sections
   - Preserves original page numbering

4. **Output Generation**:
   - Creates structured JSON output with:
     - Document title
     - Hierarchical outline
     - Page references
     - Cleaned text content

## Key Features

- **Accurate Heading Detection**: Combines font characteristics with content patterns
- **Duplicate Removal**: Uses fingerprinting to eliminate repeated sections
- **Error Resilience**: Comprehensive error handling for malformed PDFs
- **Structured Output**: Clean JSON format for easy integration

## Libraries Used

- **pdfplumber**: For PDF text and font attribute extraction
- **Pydantic**: For data validation and JSON schema enforcement
- **NumPy**: For statistical calculations (median font size)
- **re**: For text cleaning and pattern matching

## Requirements
- Process all PDFs in `/app/input`
- Output structured JSONs in `/app/output`
- Must run on CPU (AMD64), no internet
- Output format must match `output_schema.json`

## Folder Structure
Challenge_1a/
├── sample_dataset/
│ ├── pdfs/
│ ├── outputs/
│ └── schema/output_schema.json
├── Dockerfile
├── main.py
└── README.md


## Usage

### Build
```bash
docker build --platform linux/amd64 -t pdf-processor .
OR
docker build -t round1a-app .    

```

### Run
```bash
docker run --rm -v "$(pwd)/sample_dataset/pdfs:/app/input" -v "$(pwd)/sample_dataset/outputs:/app/output" --network none pdf-processor
```

<!-- docker run -it -v "$(pwd)/sample_dataset/pdfs:/app/sample_dataset/pdfs" -v "$(pwd)/sample_dataset/outputs:/app/sample_dataset/outputs" pdf-processor
 -->

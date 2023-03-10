#!/bin/bash
# This simulates what a potential call would look like

# ENV LOADING
export OPENAI_SECRET_KEY="sk-*******"
CONTENT="$(cat prompt-example.yaml)"

# CALL
scripts/prompts/generate_markdown.sh "$CONTENT"